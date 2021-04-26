# Create and update code output slides
# Candace Savonen 2021

################################ Initial Set Up ################################
# Establish base dir
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

# Magrittr pipe
`%>%` <- dplyr::`%>%`

library(rgoogleslides)
library(optparse)

# Run this authorization here
rgoogleslides::authorize()

################################ Set up options ################################
# Set up optparse options
option_list <- list(
  make_option(
    opt_str = c("-s", "--slides_id"), type = "character",
    default = NULL, 
    help = "Slide ID obtained from Google Slides URL",
    metavar = "character"
  ),
  make_option(
    opt_str = c("-g", "--git_repo"), type = "character",
    default = NULL, help = "Github repo name where images are stored. e.g. 'jhudsl/ITCR_Course_Template_Bookdown'",
    metavar = "character"
  ),
  make_option(
    opt_str = c("-b", "--git_branch"), type = "character",
    default = "main", help = "Github branch where we should uses images for storing. e.g. 'dev'",
    metavar = "character"
  ),
  make_option(
    opt_str = c("-i", "--image_loc"), type = "character",
    default = "_bookdown_files", help = "Directory where images to be added to Google slides are stored",
    metavar = "character"
  ),
  make_option(
    opt_str = c("-k", "--image_key_dir"), type = "character",
    default = "resources", help = "Directory to store 'image_to_slide_key.tsv'. Default is resources/",
    metavar = "character"
  )
)

# Parse options
opt <- parse_args(OptionParser(option_list = option_list))

# Slide id refers the id of the entire slide deck
slides_id <- opt$slides_id

# Test by getting slide properties, but don't print it out
tmp <- get_slides_properties(slides_id)

# Put it relative to root directory
image_key_dir <- file.path(root_dir, opt$image_key_dir)

# Check if directory exists
if (!dir.exists(image_key_dir)) {
  stop(paste("The directory specified,", opt$image_key_dir, "does not exist in the root directory."))
}

# Declare file path    
image_key_file <- file.path(opt$image_key_dir, "image_to_slide_key.tsv")

# Declare local location of images
local_image_loc <- file.path(root_dir, opt$image_loc)

# Check if directory exists
if (!dir.exists(local_image_loc)) {
  stop(paste("The directory specified,", opt$image_loc, "does not exist in the root directory."))
}

# If git repo is not named, try to grab it from the git config file
if (is.null(opt$git_repo)) {
  # Read in git config file
  git_config <- readLines(file.path(root_dir, ".git", "config"))
  
  # Extract git url from that file
  git_url <- grep("url = ", git_config, value = TRUE)
  
  # Just get the git repo name
  opt$git_repo <- gsub("\\turl = https://github.com/|\\.git", "", git_url)
}

# Check if we can find the branch if we aren't using main
if (opt$git_branch != "main") {
  test_url <- paste0("https://github.com/", opt$git_repo, "/tr4ee/", opt$git_branch)

  output <- try(readLines(test_url, n = 1))
  
  if (class(output) == "try-error")
  stop(paste("Double check your --git_branch and --git_repo options, could not find anything at those specifications", output))
}


############################## Set up Functions ################################
# Make a function that makes a new slide
make_new_slide <- function(slides_id) {
  # Start up a request
  requests <- add_create_slide_page_request(predefined_layout = "BLANK") 
  
  # Commit to the slides
  commit_to_slides(slides_id, requests)
  
  # Get slide details
  slide_details <- get_slides_properties(slides_id)
  
  # Get the newly made slide page id
  slide_page <- tail(slide_details$slides$objectId, n = 1)
  
  return(slide_page)
}

add_image <- function(image_url,
                      slide_page,
                      slides_id){
  
  # Get the position details of the element on the slide
  page_element <- suppressWarnings(
    aligned_page_element_property(slide_page_id = slide_page,
                                  align = "full")
  )
  
  # Create request
  request <- add_create_image_request(url = image_url,
                                      page_element_property = page_element)
  
  # Commit image to slide
  response <- commit_to_slides(slides_id, request)
  
  # Get image info 
  new_image_info <- data.frame(
    image_url = image_url,
    page_id = slide_page,
    image_id = response$replies[[1]][[1]]
  )
  
  # Return this
  return(new_image_info)
}

# Add image to slide
add_image_slide <- function(image_url,
                            slides_id) {
  
  # Make a new slide
  slide_page <- make_new_slide(slides_id)
  
  
  image_df <- add_image(image_url = image_url,
                        slide_page = slide_page,
                        slides_id = slides_id)
  
  return(image_df)
}

# Wrapper to delete image and then re-add it
refresh_image <- function(image_url,
                          slide_page,
                          image_id, 
                          slides_id) {
  
  # Create delete request
  delete_request <- add_delete_object_request(object_id = as.character(image_id))
  
  # Commit this image 
  commit_to_slides(slides_id, delete_request)
  
  # Add back images
  image_df <- add_image(image_url = image_url,
                        slide_page = slide_page,
                        slides_id = slides_id)
  
  return(image_df)
}

######################### Get image file paths #################################
# Get the list of all the code image files
images <- list.files(local_image_loc, pattern = ".png", full.names = TRUE, recursive = TRUE)

# Get relative image paths
rel_image_paths <- gsub(paste0(root_dir, "/"), "", images)

# Build github url based on the local image location
image_urls <- paste0("https://raw.githubusercontent.com/", opt$git_repo, "/", opt$git_branch, "/", rel_image_paths)

# If the image key file exists, read it in, otherwise create one
if (!file.exists(image_key_file)) {
  # Set up data frame with images 
  image_df <- data.frame(image_urls, 
                         page_id = as.character(NA), 
                         image_id = as.character(NA))
  
  # Write TSV 
  readr::write_tsv(image_df, image_key_file)
} 

# Read in the image key file
image_df <- readr::read_tsv(image_key_file)

# Add new slides for all images that don't have slides yet
images_without_slides <- image_df %>% 
  dplyr::filter(is.na(page_id))

# If there are images without slides, run them
if (nrow(images_without_slides) > 0) {
  new_slide_images <- 
    images_without_slides %>% 
    dplyr::pull(image_urls) %>% 
    purrr::map_dfr(add_image_slide, 
                   slides_id = slides_id)

  # Combine old image slides with new ones only if they exist
  if (all(is.na(image_df$page_id))) {
    # Otherwise, the new_slide_images is now our new data.frame
    image_df <- new_slide_images
  } else {
    # If there were images with slides before this, then bind the new to the old
    image_df <- dplyr::bind_rows(dplyr::filter(image_df, !is.na(page_id)), 
                                 new_slide_images)
  }

  # Write this to the file
  readr::write_tsv(image_df, image_key_file)

}

# Run this for each row (each image of data)
refreshed_image_df <- apply(image_df, 1, 
                            function(image_df) {
                              refreshed_image_df <- 
                                refresh_image(image_url = image_df['image_url'],
                                              slide_page = image_df['page_id'],
                                              image_id = image_df['image_id'], 
                                              slides_id = slides_id)
                              return(refreshed_image_df)
      })

# Write refreshed image info to TSV 
readr::write_tsv(refreshed_image_df, image_key_file)
