# Create and update code output slides

################################ Initial Set Up ################################
# Establish base dir
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

`%>%` <- dplyr::`%>%`

library(rgoogleslides)
rgoogleslides::authorize()

# Slide id refers the id of the entire slide deck
slides_id <- "1KMPnRS7hOS9BHUzTPyt8cxwCHCK6E1bFRdxzU8BExiU"

# Declare local location of images
local_image_loc <- file.path(root_dir, "_bookdown_files")

# Declare image key file path
image_key_file <- file.path(root_dir, "resources", "image_to_slide_key.tsv")

# Get the list of all the code image files
images <- list.files(local_image_loc, pattern = ".png", full.names = TRUE, recursive = TRUE)

# Get relative image paths
rel_image_paths <- gsub(paste0(root_dir, "/"), "", images)

# Build github url based on the local image location
base_images_urls <- paste0("https://raw.githubusercontent.com/jhudsl/ITCR_Course_Template_Bookdown/main/", rel_image_paths)

# If the image key file exists, read it in, otherwise create one
if (!file.exists(image_key_file)) {
  # Set up data frame with images 
  image_df <- data.frame(base_images_urls, 
                         slide_id = as.character(NA), 
                         image_id = as.character(NA))
  
  # Write TSV 
  readr::write_tsv(image_df, image_key_file)
} 

# Read in the image key file
image_df <- readr::read_tsv(image_key_file)

create_new_slide <- function(slides_id) {
  # Create a slide request
  request <- add_create_slide_page_request() 

  # Commit those changes
  commit_to_slides(slides_id, request)

  # Extract slide information
  slide_data <- get_slides_properties(slides_id)

  # Get the new slide info 
  new_slide_id <- slide_data$slides$slideProperties$layoutObjectId[nrow(slide_data$slides)]
  
  # Print out the new slide id
  return(new_slide_id)
}

# Add image to slide
add_image_slide <- function(image_url, slides_id) {
  
  # Create a new slide
  new_slide_id <- create_new_slide(slides_id)

  # Set up image request
  image_request <- add_create_image_request(google_slides_request = NULL, 
                                            aligned_page_element_property(new_slide_id, 
                                                                          align = "full"),
                                            url = image_url)
  
  # Commit this image 
  commit_to_slides(slides_id, image_request)
  
  # Extract slide information
  slide_data <- get_slides_properties(slides_id)

  # Number of slides
  n_slides <- nrow(slide_data$slides)
  
  # Get image info 
  new_image_info <- data.frame(
    base_images_urls = image_url,
    slide_id = new_slide_id,
    image_id = slide_data$layouts$pageElements[[11]]$objectId[n_slides]
    )
  # Return this
  return(new_image_info)
}

new_slide_images <- image_df %>% 
  dplyr::filter(is.na(slide_id)) %>% 
  dplyr::pull(base_images_urls) %>%
  purrr::map_df(add_image_slide, slides_id = slides_id)

# Combine old image slides with new ones only if they exist
if (all(is.na(image_df$slide_id))) {
  # Otherwise, the new_slide_images is now our new data.frame
  image_df <- new_slide_images
} else {
  # If there were images with slides before this, then bind the new to the old
  image_df <- dplyr::bind_rows(dplyr::filter(image_df, !is.na(slide_id)), 
                               new_slide_images)
}


# Wrapper to delete image and then re-add it
refresh_image(image_url = image_df$base_images_urls[1], 
              image_id = image_df$image_id[1], 
              slides_id) {
  
  # Create delete request
  delete_request <- add_delete_object_request(object_id = image_id)
  
  # Commit this image 
  commit_to_slides(slides_id, delete_request)
  
  # Set up image request
  image_request <- add_create_image_request(google_slides_request = NULL, 
                                            aligned_page_element_property(slide_id, 
                                                                          align = "full"),
                                            url = image_url)
  
  # Commit this image 
  commit_to_slides(slides_id, image_request)
  
  # Extract slide information
  slide_data <- get_slides_properties(slides_id)
  
  # Number of slides
  n_slides <- nrow(slide_data$slides)
  
  # Get new image id
  new_image_id <- slide_data$layouts$pageElements[[11]]$objectId[n_slides]
}


purrr::map2_dfc(image_df$base_images_urls, 
                image_df$image_id,  
                refresh_image, 
                slides_id = slides_id)



