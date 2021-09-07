
# A script that calls the render-rmd-coursera for all rmd files listed in the
# _bookdown.yml for this repository

# C. Savonen 2021

# Usage (from Terminal):
# Rscript -e "render_all_coursera.R"

# Assumes script is located in the scripts folder
root_dir <- rprojroot::find_root("_bookdown.yml")

# Create output folder
output_dir <- file.path("docs", "coursera")
dir.create(output_dir, showWarnings = FALSE)

# Clean out old files if they exist
old_files <- list.files(output_dir, pattern = c("html$", "md$"), full.names = TRUE)
if (length(old_files) > 0) {
  file.remove(old_files)
}

# Copy these directories over if they don't exist in the output folder
needed_directories <- c("assets", "code_output", "resources")

lapply(needed_directories, function(needed_dir) {
  if (!dir.exists(file.path(output_dir, needed_dir))) {
    fs::dir_copy(needed_dir, file.path(output_dir, needed_dir), overwrite = TRUE)
  }
})

# Slightly different path for the libs folder
libs_path <- file.path("docs", "libs")
if (!dir.exists(file.path(output_dir, "libs"))) {
  fs::dir_copy(libs_path, file.path(output_dir, "libs"), overwrite = TRUE)
}

# Retrieve list of Rmd files from the _bookdown.yml
output_yaml <- yaml::yaml.load_file(file.path(root_dir, "_output.yml"))

# Change CSS file to coursera special one
output_yaml$`bookdown::gitbook`$css <- gsub("\\.css", "_coursera.css", output_yaml$`bookdown::gitbook`$css)
output_yaml$`bookdown::html_book`$css <- gsub("\\.css", "_coursera.css", output_yaml$`bookdown::html_book`$css)

# Write this new coursera yml
yaml::write_yaml(output_yaml, file.path(output_dir, "_output_coursera.yml"))

# Do the render
bookdown::render_book(
  input = "index.Rmd",
  output_yaml = file.path(output_dir, "_output_coursera.yaml"),
  output_dir = output_dir)
