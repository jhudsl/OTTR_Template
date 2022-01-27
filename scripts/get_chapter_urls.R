#!/usr/bin/env Rscript

# Written by Candace Savonen Dec 2021
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

# Find .git root directory
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

chapt_df <- cow::get_chapters(repo_name = opt$repo, 
                              git_pat = opt$git_pat,
                              retrieve_keywords = FALSE)

urls <- unique(chapt_df$url)

# Print out download url 
write(urls, stdout())
