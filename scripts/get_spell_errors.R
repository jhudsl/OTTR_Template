#!/usr/bin/env Rscript

# Written by Candace Savonen Dec 2021

# Ran by GitHub actions, given a repository name and a GitHub PAT, get the most recent spell check results.

library(magrittr)
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

repo_name <- opt$repo
git_pat <- opt$git_pat

if (!is.character(repo_name)) {
  repo_name <- as.character(repo_name)
}

if (!is.character(git_pat)) {
  git_pat <- as.character(git_pat)
}

# Declare URL
url <- paste0("https://api.github.com/repos/", repo_name, "/actions/artifacts")
  
# Github api get
response <- httr::GET(
  url,
  httr::add_headers(Authorization = paste0("token ", git_pat)),
  httr::accept_json()
)
  
if (httr::http_error(response)) {
  warning(paste0("url: ", url, " failed"))
}
  
# Get content as JSON
artifacts <- httr::content(response, as = "parsed")$artifacts

if (length(artifacts) < 1) {
  warning("No results")
}

# Make it a data frame
artifacts_df <- do.call(rbind.data.frame, as.list(artifacts))

# We only care about the spell check results and the most recent one
the_url <- artifacts_df %>% 
  dplyr::filter(name == "spell-check-results") %>% 
  dplyr::top_n(1, created_at) %>%
  dplyr::pull(archive_download_url)
  
# Github api get the location of the artifact
response <- httr::GET(
  the_url,
  httr::add_headers(Authorization = paste0("token ", git_pat))
)

# Print out download url 
write(response$url, stdout())
