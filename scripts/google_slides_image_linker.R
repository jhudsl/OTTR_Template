# Create and update code output slides
# Candace Savonen 2021

# Example command line usage:

# Rscript scripts/google_slides_image_linker.R \
# --slides_id <SLIDE_ID FROM URL> \
# --image_loc "_bookdown_files" \
# --image_key_dir "resources" \
# --git_repo  "jhudsl/ITCR_Course_Template_Bookdown" \
# --git_branch "cansavvy/add-rgoogleslides"

################################ Initial Set Up ################################
# Establish base dir
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

# Magrittr pipe
`%>%` <- dplyr::`%>%`

library(rgoogleslides)
library(optparse)

# Import special functions
source(file.path(root_dir, "scripts", "util", "google-slides.R"))

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
    default = "_bookdown_files", help = "Directory where code output images to be added to Google slides are stored",
    metavar = "character"
  ),
  make_option(
    opt_str = c("-k", "--image_key_dir"), type = "character",
    default = "resources", help = "Directory to store 'image_to_slide_key.tsv'. Default is resources/",
    metavar = "character"
  ),
  make_option(
    opt_str = c("-r", "--refresh_token"), type = "character",
    default = NULL, help = "Can be obtained from: token <- rgoogleslides::authorize(); token$credentials$refresh_token",
    metavar = "character"
  ),
  make_option(
    opt_str = c("-a", "--access_token"), type = "character",
    default = NULL, help = "Can be obtained from: token <- rgoogleslides::authorize(); token$credentials$access_token",
    metavar = "character"
  )
)

# Parse options
opt <- parse_args(OptionParser(option_list = option_list))

# Check the tokens
if (is.null(opt$access_token)) {
  stop("Access token is NULL. Set using --access_token.")
}

if (is.null(opt$refresh_token)) {
  stop("Refresh token is NULL. Set using --refresh_token.")
}

# Get token from tokens
token <- authorize_from_secret(opt$access_token,
                               opt$refresh_token)

# Refresh token
token <- token$refresh()

# Authorize using that token
rgoogleslides::authorize(token = token)

# Slide id refers the id of the entire slide deck
slides_id <- as.character(opt$slides_id)

# Test by getting slide properties, but don't print it out
slide_properties <- get_slides_properties(slides_id)

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

# Check if we can find the branch 
test_url <- paste0("https://github.com/", opt$git_repo, "/tree/", opt$git_branch)
  
output <- try(readLines(test_url, n = 1))
  
if (class(output) == "try-error") stop(paste("Double check your --git_branch and --git_repo options, could not find anything at those specifications", output))

######################### Set up image key file ################################
# Get the list of all the code image files
images <- list.files(local_image_loc, pattern = ".png", full.names = TRUE, recursive = TRUE)

# Get relative image paths
rel_image_paths <- gsub(paste0(root_dir, "/"), "", images)
  
# Build github url based on the local image location
image_url <- paste0("https://raw.githubusercontent.com/", 
                     opt$git_repo, 
                     "/", 
                     opt$git_branch, 
                     "/", 
                     rel_image_paths)

if (file.exists(image_key_file)) {
  # If image key file exists, read in the image key file
  image_df <- readr::read_tsv(image_key_file, 
                              col_types = readr::cols(.default = "c"))
} else {
  # If image key file doesn't exist, create it
  # Set up data frame with images 
  image_df <- data.frame(image_url, 
                         page_id = as.character(NA), 
                         image_id = as.character(NA))
  
  # Write TSV 
  readr::write_tsv(image_df, image_key_file)
} 

# We only want to keep images we have currently in the folder
image_df <- data.frame(image_url) %>% 
  dplyr::left_join(image_df) %>% 
  # Erase the page_id if it no longer exists in the slide set
  dplyr::mutate(page_id = dplyr::case_when(
    is.na(page_id) ~ "no_slide",
    page_id %in% slide_properties$slides$objectId ~ page_id,
    TRUE ~ "no_slide"
  )) 

####################### Add new code output images #############################

# Add new slides for all images that don't have slides yet
images_without_slides <- image_df %>% 
  dplyr::filter(page_id == "no_slide")

# If there are images without slides, run this chunk
if (nrow(images_without_slides) > 0) {
  # Get image urls for images that don't have slides
  new_slide_images <- 
    images_without_slides %>% 
    dplyr::pull(image_url) %>% 
    # Add new slides for each image that doesn't have a slide
    purrr::map_dfr(add_image_slide, 
                   slides_id = slides_id)

  # Combine old image slides with new ones only if they exist
  if (all(is.na(image_df$page_id))) {
    # Otherwise, the new_slide_images is now our new data.frame
    image_df <- new_slide_images
  } else {
    # If there were images with slides before this, then bind the new to the old
    image_df <- dplyr::bind_rows(dplyr::filter(image_df, 
                                               page_id != "no_slide"), 
                                 new_slide_images)
  }
  # Write this to the file
  readr::write_tsv(image_df, image_key_file)
}

########################### Refresh images on slide ############################
# Run this for each row (each image of data)
refreshed_image_df <- apply(image_df, 1, 
                            function(image_df) {
                              # Save new data frame of the refreshed output
                              refreshed_image_df <- 
                                refresh_image(image_url = image_df['image_url'],
                                              slide_page = image_df['page_id'],
                                              image_id = image_df['image_id'], 
                                              slides_id = slides_id)
                              return(refreshed_image_df)
      })

# Write refreshed image info to TSV 
refreshed_image_df <- dplyr::bind_rows(refreshed_image_df) %>% 
  readr::write_tsv(image_key_file)

# Print out message
message(paste0("Slides should be updated; go to https://docs.google.com/presentation/d/", slides_id))
