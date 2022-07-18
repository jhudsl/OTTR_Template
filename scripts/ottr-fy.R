#!/usr/bin/env Rscript

# This script downloads all the files and sets up the folders you need to
# OTTR-fy a repository that has markdown or R Markdown files

library(magrittr)

# Find .git root directory
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

base_url <- "https://raw.githubusercontent.com/jhudsl/OTTR_Template/main/"

needed_files <- c(
  ".github/workflows/pull_request.yml",
  ".github/workflows/render-all.yml",
  ".github/workflows/delete-preview.yml",
  ".github/workflows/docker-build.yml",
  "scripts/git_repo_check.R",
  "scripts/make_screenshots.R",
  "scripts/quiz-check.R",
  "scripts/spell-check.R",
  "scripts/url-check.R",
  "_bookdown.yml",
  "_output.yml",
  "book.bib",
  "config_automation.yml", 
  "assets/big-image.html",
  "assets/footer.html"
  )

# Set up a file list with the destination locations as the names
url_to_files <- paste0(base_url, needed_files)
names(url_to_files) <-  file.path(root_dir, needed_files)

# Download the file in the respective place 
for (index in 1:length(url_to_files)) {
  dest_folder <- dirname(names(url_to_files)[index])
  if (!dir.exists(dest_folder)){
    dir.create(dest_folder, recursive = TRUE)
  }
  download.file(url = url_to_files[index], destfile = names(url_to_files)[index])
}

