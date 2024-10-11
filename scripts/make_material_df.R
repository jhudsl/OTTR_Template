#!/usr/bin/env Rscript

# This script sets up a dataframe that has all the information for the 
# quizzes, topics, materials, projects, and swirl modules and in what order they belong

# Written by Candace Savonen June 2023

if (!('devtools' %in% installed.packages())) {
  # install.packages("remotes", repos = "http://cran.us.r-project.org")
}

if (!('optparse' %in% installed.packages())) {
  # install.packages("optparse", repos = "http://cran.us.r-project.org")
}

# Find .git root directory
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))


library(optparse)
library(magrittr)

option_list <- list(
  optparse::make_option(
    c("--owner_id"),
    type = "character",
    default = NULL,
    help = "Owner id",
  ),
  optparse::make_option(
    c("--course_name"),
    type = "character",
    default = NULL,
    help = "Course name for this",
  ),
  optparse::make_option(
    c("--repo"),
    type = "character",
    default = NULL,
    help = "GitHub repository name, e.g. jhudsl/OTTR_Template",
  ),
  optparse::make_option(
    c("--git_pat"),
    type = "character",
    default = NULL,
    help = "GitHub personal access token",
  ),
  optparse::make_option(
    c("--output_dir"),
    type = "character",
    default = "resources/chapt_screen_images",
    help = "Output directory where the chapter's screen images should be stored",
  ),
  optparse::make_option(
    c("--base_url"),
    type = "character",
    default = NULL,
    help = "Output directory where the chapter's screen images should be stored",
  ), 
  optparse::make_option(
    c("--make_book_txt"),
    action = "store_true",
    help = "Should book.txt file be made freshly?",
  )
)

# Read the arguments passed
opt_parser <- optparse::OptionParser(option_list = option_list)
opt <- optparse::parse_args(opt_parser)


# Establish output folder
output_folder <- file.path(opt$output_dir)
if (!dir.exists(output_folder)) {
  dir.create(output_folder, recursive = TRUE)
}

# Retrieve base_url for github pages if it has not been specified
if (is.null(opt$base_url)) {
  base_url <- cow::get_pages_url(repo_name = opt$repo, git_pat = opt$git_pat)
  base_url <- gsub("/$", "", base_url)
}


#### Get chapters 
# Retrieve chapters from what's on the github pages
retrieve_chapters <- ottrpal::get_chapters(base_url)

## Get chapter list and urls
chapter_df <- data.frame(
  retrieve_chapters,
  full_urls = paste0(base_url, retrieve_chapters$url), 
  md_name = paste0(gsub(" ", "-", retrieve_chapters$chapt_title), ".md")
)

##### Get Quizzes
quiz_files <- list.files(file.path(root_dir, "quizzes"), pattern = ".md")

if (opt$make_book_txt) {
  # Make book.txt fresh
  ottrpal::bookdown_to_book_txt(md_files = list.files(file.path(root_dir, "manuscript"), pattern = ".md"))
}

## Read in Book.txt
book_txt <- readLines(file.path(root_dir, "manuscript", "Book.txt"))

## Make a data frame from this
book_txt_df <- data.frame(md_name = book_txt) %>%
  dplyr::mutate(type = dplyr::case_when(
    grepl("quiz", md_name) ~ "quiz",
    TRUE ~ "chapter"))

# Join it to the chapter df
book_txt_df <- book_txt_df %>% 
  dplyr::left_join(chapter_df, 
                    by = "md_name") 

## Write this file. 
### You may want to add due dates to this file manually. 
readr::write_tsv(book_txt_df, file.path("resources", "course_units.tsv")) 

