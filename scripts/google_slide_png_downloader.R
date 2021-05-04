# Download all files from a Google Slides set as PNGs
# Candace Savonen 2021

# Example command line usage:

# Rscript scripts/google_slide_png_downloader.R \
# --slides_id <SLIDE_ID FROM URL> \
# --gs_loc "resources/gs_slides" \

################################ Initial Set Up ################################
# Establish base dir
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

# Magrittr pipe
`%>%` <- dplyr::`%>%`

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
    opt_str = c("--gs_loc"), type = "character",
    default = "resources/gs_slides", help = "Directory where Google Slide images are to be downloaded. Directory will be created if it doesn't exist",
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

# Get all page IDs
slide_pages <- slide_properties$slides$objectId

######################### Download each slide as a PNG #########################
# If the directory exists, clear it out for now
if (dir.exists(opt$gs_loc)) {
  # Remove all pngs for now
  file.remove(dir(opt$gs_loc, full.names = TRUE))
}

lapply(slide_pages,
      function(slide_page) {

        # Download slides again
        download_gs_png(slides_id = slides_id,
                        slide_page = slide_page,
                        output_dir = opt$gs_loc)
        })

# Print out message
message(paste("Slide PNGs downloaded to", opt$gs_loc))
