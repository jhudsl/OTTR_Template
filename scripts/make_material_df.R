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
  full_urls = paste0(base_url, retrieve_chapters$url)
)

##### Get Quizzes
quiz_dir <- file.path(root_dir, "quizzes")

## Autogenerate Book.txt file
ottrpal::bookdown_to_book_txt(quiz_dir)

## Read in Book.txt
book_txt <- readLines(file.path(root_dir, "manuscript", "Book.txt"))

## Make a data frame from this
book_txt_df <- data.frame(file_names = book_txt) %>%
  dplyr::mutate(type = dplyr::case_when(
    grepl("quiz", file_names) ~ "quiz",
    TRUE ~ "chapter"))

# Join it to the chapter df
book_txt_df <- book_txt_df %>% 
  dplyr::inner_join(book_txt_df, 
                    by = "chapt_title") 

# We need to make this column so we can link swirl modules to their chapters
chapter_df <- chapter_df %>% 
  dplyr::mutate(core_file_name = gsub("_quiz.md$", "", chapter_df $quiz_file))

#### Link swirl modules to chapters 
swirl_modules <- googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/1b60iMYr6gtJ0X0ifcXlR4u3TSe1JaUW3uIUN9SOl14E/edit#gid=0",
  sheet = "Swirl_Key") %>% 
  dplyr::filter(!is.na(module_name)) %>% 
  dplyr::select(-rowname)

chapter_df <- chapter_df %>% 
  dplyr::left_join(swirl_modules, 
                   by = c("core_file_name" = "associated_chapter"))

### Signify which chapters are projects 
chapter_df <- chapter_df %>% 
  dplyr::mutate(type = dplyr::case_when(
    grepl("Project$", chapter_df$chapt_title) ~ "Project", 
    grepl(paste0(topics, collapse = "$|"), chapter_df$chapt_title) ~ "New topic",
    TRUE ~ "Chapter"))

chapter_df <- chapter_df %>%
  ### Establish unit times 
  dplyr::mutate(unit_time = dplyr::case_when(type == "Chapter" ~ 1, 
                                             type == "Project" ~ 5, 
                                              TRUE ~ 0)) %>% 
  dplyr::mutate(swirl_yn = !is.na(module_name),
                quiz_yn = !is.na(quiz_file), 
                unit_time = unit_time + swirl_yn + quiz_yn) 

googlesheets4::write_sheet(
  chapter_df,
  "https://docs.google.com/spreadsheets/d/14PRS2qEed3E636QsorJFkgN94ikj3SeF1AgpoC-0bo0/edit#gid=0", 
  sheet = "chapter_df"
  )

# Write this to a TSV 
readr::write_tsv(chapter_df, file.path(root_dir, "materials_order.tsv"))
