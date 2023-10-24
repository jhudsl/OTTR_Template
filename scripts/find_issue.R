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

install.packages('githubr', repos='http://cran.us.r-project.org')
# devtools::install_github("fhdsl/githubr", auth_token = opt$git_pat, dependencies = TRUE)

issue_titles <- githubr::get_issues(opt$repo, git_pat = opt$git_pat)$title

issue_exists <- any(grep('Broken URLs found in the course!', issue_titles))

# Print out the result
write(as.character(issue_exists), stdout())
