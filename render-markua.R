
## Render for Markua script 
# Candace Savonen 
# April 2021

# Establish base dir by looking for .git file
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

# Where's the destination folder?
manuscript_dir <- file.path(root_dir, "manuscript")
if (!dir.exists(manuscript_dir)) {
  dir.create(manuscript_dir)
}

# Re-serve the bookdown to make sure all is up to date
# bookdown::serve_book()

# Obtain the list of Rmd files we want to convert
rmds <- list.files(path = root_dir, pattern = "\\.Rmd")

# Exclude index file
rmds <- grep("index", rmds, invert = TRUE, value = TRUE)
  
# Establish a function to convert an Rmd -> Markua friendly md
make_markua <- function(rmd) {
  # Get the basename of the file
  base_name <- gsub("\\.Rmd", "", rmd)
  
  # Declare location of where the figures should be stored
  fig_loc <- file.path(manuscript_dir, "resources", "images", base_name, "")
  
  # Create this directory if it doesn't exist yet
  if (!dir.exists(fig_loc)) {
    dir.create(fig_loc)
  }
  
  # Run the rendering
  rmarkdown::render(rmd,
                    intermediates_dir = manuscript_dir,
                    output_dir = manuscript_dir,
                    clean = FALSE, # We have to say clean false so plots stay
                    run_pandoc = FALSE,
                    output_format = rmarkdown::output_format(
                      knitr = rmarkdown::knitr_options(opts_chunk = list(fig.path = fig_loc)),
                      # We aren't running pandoc but it doesn't like not having something for this argument
                      pandoc = rmarkdown::pandoc_options(to = "md"))
                    )
  
  # But now, we have to pay the consequences for using clean = FALSE and pandoc
  file.remove(file.path(manuscript_dir, paste0(base_name, ".md")))
  file.remove(file.path(manuscript_dir, paste0(base_name, ".utf8.md")))
  
  # Declare markdown file name and path for the one we want
  md_file <- file.path(manuscript_dir, paste0(base_name, ".knit.md"))
  
  ##### Add Markua tags to all images
  # Read in as lines
  lines <- readr::read_lines(md_file)
  
  # Set up image tag that will be used for all images
  image_tag <- "{alt: 'an image', width=80%}"
  
  # Find which lines have markdown links
  new_lines <- stringr::str_replace(lines, "\\!\\[", paste0(image_tag, "\\!\\["))
  
  # Overwrite markdown file
  readr::write_lines(new_lines, md_file)
}

# Run this on all the files!
lapply(rmds, make_markua)
  