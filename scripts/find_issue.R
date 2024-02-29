#!/usr/bin/env Rscript

# Written by Candace Savonen Sept 2021

if (!("optparse" %in% installed.packages())){
  install.packages("optparse")
}

library(optparse)

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
  )
)

# Read the arguments passed
opt_parser <- optparse::OptionParser(option_list = option_list)
opt <- optparse::parse_args(opt_parser)

repo <- opt$repo
git_pat <- opt$git_pat

if (!is.character(repo)) {
  repo <- as.character(repo)
}

# Github api get
result <- httr::GET(
  paste0("https://api.github.com/repos/", repo, "/issues"),
  httr::add_headers(Authorization = paste0("Bearer ", git_pat)),
  httr::accept_json()
)

if (httr::status_code(result) != 200) {
  httr::stop_for_status(result)
}

# Process and return results
result_content <- httr::content(result, "text")
result_list <- jsonlite::fromJSON(result_content)

issue_exists <- length(grep('Broken URLs found in the course!', result_list$title))

# Print out the result
write(issue_exists, stdout())
