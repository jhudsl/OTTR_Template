
# A script that calls the render-rmd-coursera for all rmd files listed in the
# _bookdown.yml for this repository

# C. Savonen 2021

# Usage (from Terminal):
# Rscript -e "render_all_coursera.R"

# Assumes script is located in the scripts folder

root_dir <- rprojroot::find_root("_bookdown.yml")

# Retrieve list of Rmd files from the _bookdown.yml
rmd_files <- leanbuild::get_bookdown_spec(root_dir)$rmd_files

# Create output folder
output_dir <- file.path("docs", "coursera")
dir.create(output_dir, showWarnings = FALSE)


# Create symlinks to the files we need
files_needed <- c(
  file.path("assets"),
  file.path("libs"),
  file.path("book.bib"),
  file.path("packages.bib")
  )

# Make a function
create_symlink <- function(file) {
  if (!file.exists(file)) {
  file.symlink(from = file, to = file.path(output_dir, file))
  }
}
# Run it
lapply(files_needed, create_symlink)

# Set up function which will call the
render_coursera <- function(rmd_file, verbose = FALSE) {

  # Construct output file name
  output_filename <- gsub(".Rmd$", ".html", rmd_file)

  # Build the command
  r_command <-
    paste0("Rscript --vanilla ", file.path(root_dir, "scripts", "render_rmd_coursera.R"),
    " --rmd ", rmd_file,
    " --css_file ", file.path("assets", "style_ITN_coursera.css"),
    " --output_tag _coursera",
    " --output_dir ", output_dir,
    " --style")

  if (verbose) {message(r_command)}

  # Run it!
  system(r_command)

}

# Call for all files
lapply(rmd_files, render_coursera, verbose = TRUE)
