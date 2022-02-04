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

# Read in the file
key_df <- readr::read_tsv(opt$input_key_file)

make_markdown <- function(url, chapt_name, img_path) {
  # Arguments: 
  #   url: The url to the chapter
  #   chapt_name: The title of the chapter to be used as a header
  #   img_path: file path to the image to be used in the preview 
  #
  # Returns: A markdown document ready for Leanpub and the image copied to the manuscript folder
  
  chapt_file_name <- gsub(" ", "-", chapt_name)
  
  # Declare output file
  output_file <- file.path("manuscript", paste0(chapt_file_name , ".md"))
                           
  file_contents <- c(
    paste("#", chapt_name),
    " ",
    paste0("{type: iframe, title:", chapt_name, " width: 400, height: 400, poster:", img, "}"), 
    paste0("![](", url, ")")
  )

  write(file_contents, file = output_file)
  
  manuscript_dir <- file.path("manuscript", dirname(img)) 
  
  if (!dir.exists(manuscript_dir)) {
    dir.create(manuscript_dir, recursive = TRUE)
  }
  
  file.copy(from = img, to = file.path("manuscript", img), overwrite = TRUE)
  
  message(paste0("Output saved to: ", output_file))
  
  return(output_file)
}

# Run it on each row
output_files <- purrr::pmap(key_df, ~ make_markdown(url = ..1, chapt_name = ..2, img = ..3))
