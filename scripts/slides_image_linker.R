# Create and update code output slides
# Candace Savonen 2021

################################ Initial Set Up ################################
# Establish base dir
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

# Magrittr pipe
`%>%` <- dplyr::`%>%`

library(googledrive)
library(rgoogleslides)
library(optparse)

# Run this authorization here
rgoogleslides::authorize()

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


# Run this for each row (each image of data)
apply(image_df, 1, 
      function(image_df) {
        download_gs_png(slides_id = slides_id,
                        slide_page = image_df['page_id'],
                        output_dir = file.path("resources", "gs_slides"), 
                        slide_file_name = image_df['page_id'])
                            })

download_gs_png <- function(slides_id, 
                            slide_page, 
                            output_dir, 
                            slide_file_name = NULL) {
  url <- paste0("https://docs.google.com/presentation/d/",
                slide_id, 
                "/export/png?id=", 
                slide_id, 
                "&pageid=", 
                page_id
                )

  slide_folder <- file.path(root_dir, output_dir)

  if (!dir.exists(slide_folder)) {
    dir.create(slide_folder)
  }
  
  if (!grepl(slide_file_name, "\\.png")) {
    slide_file_name <- paste0(slide_file_name, ".png")
  }

  download.file(url, 
                destfile = file.path(slide_folder, slide_file_name))
  
}
