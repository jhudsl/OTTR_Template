
# A script that calls the render-rmd-coursera for all rmd files listed in the
# _bookdown.yml for this repository

# C. Savonen 2021

# Usage (from Terminal):
# Rscript -e "render_all_coursera.R"

# Assumes script is located in the scripts folder

root_dir <- rprojroot::find_root("_bookdown.yml")

# Retrieve list of Rmd files from the _bookdown.yml
rmd_files <- leanbuild::get_bookdown_spec(root_dir)$rmd_files

# But we don't need the index file
rmd_files <- grep("index", rmd_files, invert = TRUE, value = TRUE)

# Create output folder
output_dir <- file.path("docs", "coursera")
dir.create(output_dir, showWarnings = FALSE)

# Copy all these things into the coursera folder
dir_copy("assets", file.path(output_dir, "assets"))
dir_copy("docs/libs", file.path(output_dir, "libs"))
dir_copy("resources", file.path(output_dir, "resources"))
file_copy("book.bib", file.path(output_dir, "book.bib"))
file_copy("packages.bib", file.path(output_dir, "packages.bib"))

# Set up function which will call the
render_coursera <- function(rmd_file, verbose = FALSE) {

  # Build the command
  r_command <-
    paste0("Rscript --vanilla ", file.path(root_dir, "scripts", "render_rmd_coursera.R"),
    " --rmd ", rmd_file,
    " --css_file ", file.path("assets", "style_ITN_coursera.css"),
    " --output_dir ", output_dir,
    " --style")

  if (verbose) {message(r_command)}

  # Run it!
  system(r_command)

}

# Call for all files
lapply(rmd_files, render_coursera, verbose = TRUE)
