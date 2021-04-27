# Download all files from a Google Slides set as PNGs
# Candace Savonen 2021

# Example command line usage:

# Rscript scripts/slides_image_linker.R \
# --slides_id <SLIDE_ID FROM URL> \
# --gs_loc "resources/gs_slides" \

################################ Initial Set Up ################################
# Establish base dir
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

# Magrittr pipe
`%>%` <- dplyr::`%>%`

library(optparse)

# Authorize using that token
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
    opt_str = c("--gs_loc"), type = "character",
    default = "resources/gs_slides", help = "Directory where Google Slide images are to be downloaded. Directory will be created if it doesn't exist",
    metavar = "character"
  )
)

# Parse options
opt <- parse_args(OptionParser(option_list = option_list))

# Slide id refers the id of the entire slide deck
slides_id <- opt$slides_id

# Test by getting slide properties, but don't print it out
slide_properties <- get_slides_properties(slides_id)

slide_pages <- slide_properties$slides$objectId

######################### Download each slide as a PNG #########################
apply(slide_pages, 1, 
      function(slide_page) {
        
        # If the directory exists, clear it out for now
        if (dir.exists(opt$gs_loc)) {
          # Remove all pngs for now
          file.remove(dir(opt$gs_loc, full.names = TRUE))
        }
        
        # Download slides again
        download_gs_png(slides_id = slides_id,
                        slide_page = slide_page,
                        output_dir = opt$gs_loc, 
                        slide_file_name = slide_page)
        })

# Print out message
message(paste0("Slide PNGs downloaded to", opt$gs_loc))
