# Google slide functions
# Candace Savonen 2021

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
  
  # Print progress message
  print(paste("Adding new slide for image: ", image_url))
  
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
  # Print progress message
  print(paste("Refreshing image: ", image_url))
  
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

download_gs_png <- function(slides_id, 
                            slide_page, 
                            output_dir, 
                            slide_file_name = NULL) {
  
  # Piece together URL 
  url <- paste0("https://docs.google.com/presentation/d/",
                slides_id, 
                "/export/png?id=", 
                slides_id, 
                "&pageid=", 
                slide_page
  )
  
  # Use the slide_page ID if no slide name was given
  if (is.null(slide_file_name)) {
    slide_file_name <- slide_page
  }
  
  # Set output folder
  slide_folder <- file.path(output_dir)
  
  # Create directory if it doesn't exist
  if (!dir.exists(slide_folder)) {
    dir.create(slide_folder)
  }
  
  # Add png extension to slide file name if its not there 
  if (!grepl(slide_file_name, "\\.png")) {
    slide_file_name <- paste0(slide_file_name, ".png")
  }
  
  # Download the file
  download.file(url, 
                destfile = file.path(slide_folder, slide_file_name))
  
}