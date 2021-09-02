
# A script that calls the render-rmd-coursera for all rmd files listed in the
# _bookdown.yml for this repository

# C. Savonen 2021

# Usage (from Terminal):
# Rscript -e "render_all_coursera.R"

# Assumes script is located in the scripts folder
root_dir <- rprojroot::find_root("_bookdown.yml")

# Retrieve list of Rmd files from the _bookdown.yml
rmd_files <- leanbuild::get_bookdown_spec(root_dir)$rmd_files

# Don't process index.Rmd file
rmd_files <- grep("index.Rmd", rmd_files, invert = TRUE, value = TRUE)

# Create output folder
output_dir <- file.path("docs", "coursera")
dir.create(output_dir, showWarnings = FALSE)

# Clean out old files if they exist
old_files <- list.files(output_dir, pattern = c("html$", "md$"), full.names = TRUE)
if (length(old_files) > 0) {
  file.remove(old_files)
}

# Copy over the assets
# fs::dir_copy("assets", file.path(output_dir, "assets"))

# Set up function which will call the
render_coursera <- function(rmd_file, verbose = FALSE) {

  # Build the command
  r_command <-
    paste0("Rscript --vanilla ", file.path(root_dir, "scripts", "render_rmd_coursera.R"),
    " --rmd ", file.path(root_dir, rmd_file),
    " --html ", file.path(output_dir, output_filename),
    " --css_file ", file.path("assets", "style_ITN_coursera.css"),
    " --style")

  if (verbose) {message(r_command)}

  # Run it!
  system(r_command)

}

# Call for all files
lapply(rmd_files, render_coursera, verbose = TRUE)
