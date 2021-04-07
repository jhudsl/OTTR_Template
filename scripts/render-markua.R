# Rendering script which makes bookdown Rmds into Markua friendly markdowns
# Candace Savonen 
# April 2021

# This script assumes that the bookdown Rmd files are in the base git directory. 

# Command line example:
# Rscript scripts/render-markua.R --o "manuscript" --bookdown

library(optparse)

################################ Set up options ################################
# Option descriptions
# Set up optparse options
option_list <- list(
  make_option(
    opt_str = c("-b", "--bookdown"), action = "store_true",
    default = FALSE, help = "If used re-run bookdown",
    metavar = "character"), 
  make_option(
    opt_str = c("-o", "--output_dir"), type = "character",
    default = NULL, help = "Directory that you would like all output Markua ready
    markdown files to be stored. If it doesn't exist, it will be created.",
    metavar = "character"
  ))

# Parse options
opt <- parse_args(OptionParser(option_list = option_list))

################################ Directory set up ##############################
# Where's the destination folder?
manuscript_dir <- opt$output_dir
images_dir <- file.path(manuscript_dir, "resources", "images")

# Recursively make these files if they don't exist
if (!dir.exists(images_dir)) {
  dir.create(images_dir, recursive = TRUE)
}

# Remove all the old files
system(paste("rm -r", images_dir))

# Copy over images that are otherwise needed
system(paste("cp -r docs/images/", images_dir))

# Establish base dir by looking for .git file
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

# Re-serve the bookdown to make sure all is up to date
if (opt$bookdown) {
  # Run bookdown
  bookdown::serve_book(dir = root_dir)
}

# Obtain the list of Rmd files we want to convert
rmds <- list.files(path = root_dir, pattern = "\\.Rmd")

# Exclude index file
rmds <- grep("index", rmds, invert = TRUE, value = TRUE)
  
# Establish a function to convert an Rmd -> Markua friendly md
make_markua <- function(rmd, output_dir = manuscript_dir) {
  # When supplied a file path to an Rmd, snag the markdown intermediate file and 
  # add Markua tags to image and video links. Then save the final adjusted file 
  # to the output directory supplied.
  #
  # Args:
  #   rmd : A file path to an Rmd to be converted to something Markua friendly
  #   output_dir : Where the final Markua friendly file should go
  #
  # Returns:
  # A Markua friendly file and its associated plots
  
  # Get the basename of the file
  base_name <- gsub("\\.Rmd", "", rmd)
  
  # Declare location of where the figures should be stored
  fig_loc <- file.path(output_dir, "resources", "images", base_name, "")
  
  # Create this directory if it doesn't exist yet
  if (!dir.exists(fig_loc)) {
    dir.create(fig_loc, recursive = TRUE)
  }
  
  # Run the rendering
  rmarkdown::render(rmd,
                    intermediates_dir = output_dir,
                    output_dir = output_dir,
                    clean = FALSE, # We have to say clean false so plots stay
                    run_pandoc = FALSE,
                    output_format = rmarkdown::output_format(
                      knitr = rmarkdown::knitr_options(opts_chunk = list(fig.path = fig_loc)),
                      # We aren't running pandoc but it doesn't like not having something for this argument
                      pandoc = rmarkdown::pandoc_options(to = "md"))
                    )
  
  # But now, we have to pay the consequences for using clean = FALSE and pandoc
  # file.remove(file.path(output_dir, paste0(base_name, ".md")))
  file.remove(file.path(output_dir, paste0(base_name, ".utf8.md")))
  
  # Declare markdown file name and path for the one we want
  md_file <- file.path(output_dir, paste0(base_name, ".knit.md"))
  
  ##### Add Markua tags to all images
  # Read in as lines
  lines <- readr::read_lines(md_file)
  
  #image_lines <- grep("\\!\\[", lines)
  
  #video_lines <- 
    
  # Set up image tag that will be used for all images
  image_tag <- "{alt: 'an image', width=80%}"
  
  # Find which lines have markdown links
  new_lines <- stringr::str_replace(lines, "\\!\\[", paste0(image_tag, "\\!\\["))
  
  # Overwrite markdown file
  readr::write_lines(new_lines, md_file)
  
  message(paste(md_file, "is prepped!"))
}

# Run this on all the files!
purrr::map(rmds, make_markua)
  