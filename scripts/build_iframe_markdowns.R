#!/usr/bin/env Rscript
# Written by Candace Savonen Jan 2022

if (!('optparse' %in% installed.packages())) {
  # install.packages("optparse", repos = "http://cran.us.r-project.org")
}

library(optparse)

option_list <- list(
  optparse::make_option(
    c("--input_key_file"),
    type = "character",
    default = file.path("resources", "chapt_screen_images", "chapter_urls.tsv"),
    help = "File path to a TSV whose contents are the chapter's urls in one 
    column and the file paths to the screenshot images to use in the next column",
  )
)

# Read the arguments passed
opt_parser <- optparse::OptionParser(option_list = option_list)
opt <- optparse::parse_args(opt_parser)

key_df <- readr::read_tsv(opt$input_key_file)

url <- key_df$urls[1]
img <- key_df$file_names[1]

make_markdown <- function(img, url) {
  chapt_file_name <- gsub("\\.html$", "", basename(url))

  file_contents <- c(
   paste0("{type: iframe, title:", chapt_file_name, "width: 400, height: 400, poster:", img, "}"), 
    paste0("![](", url, ")")
  )

  write(file_contents, file.path("manuscript", paste0(chapt_file_name, ".md")))
}


