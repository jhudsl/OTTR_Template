
# A script that calls the render-rmd-coursera for all rmd files listed in the 
# _bookdown.yml for this repository

# C. Savonen 2021

# Usage (from Terminal): 
# Rscript -e "render_all_coursera.R"

# Assumes script is located in the scripts folder

root_dir <- rprojroot::find_root("_bookdown.yml")
  
# Retrieve list of Rmd files from the _bookdown.yml
suppressWarnings({
    yaml_contents <- yaml::yaml.load_file(file.path(root_dir, "_bookdown.yml"))
  })
rmd_files <- yaml_contents$rmd_files

# Create output folder
output_dir <- file.path("docs", "coursera")
dir.create(output_dir, showWarnings = FALSE)

# Set up function which will call the 
render_coursera <- function(rmd_file, verbose = FALSE) {
  
  # Construct output file name
  output_filename <- gsub(".Rmd$", ".html", rmd_file)
  
  # Build the command
  r_command <- 
    paste0("Rscript --vanilla ", file.path(root_dir, "scripts", "render_rmd_coursera.R"),
    " --rmd ", file.path(root_dir, rmd_file), 
    " --html ", file.path(output_dir, output_filename),
    " --style")
  
  if (verbose) {message(r_command)}
  
  # Run it!
  system(r_command)
  
}

# Call for all files
lapply(rmd_files, render_coursera, verbose = TRUE)
