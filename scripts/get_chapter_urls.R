#!/usr/bin/env Rscript
# Written by Candace Savonen Jan 2022

if (!('devtools' %in% installed.packages())) {
  # install.packages("remotes", repos = "http://cran.us.r-project.org")
}

if (!('optparse' %in% installed.packages())) {
  # install.packages("optparse", repos = "http://cran.us.r-project.org")
}

webshot::install_phantomjs()

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

if (!('cow' %in% installed.packages())) {
  # remotes::install_github('jhudsl/cow', auth_token = opt$git_pat)
}

chapt_df <- cow::get_chapters(repo_name = opt$repo,
                              git_pat = opt$git_pat,
                              retrieve_keywords = FALSE)

urls <- unique(chapt_df$url)

output_folder <- file.path("manuscript", "chapt_screen_images")
if (!dir.exists(output_folder)) {
  dir.create(output_folder, recursive = TRUE)
}

lapply(urls, function(url) {
  file_name <- gsub(".html", ".pdf", file.path(output_folder, basename(url)))
  webshot::webshot(url, file_name)
  message(paste("Screenshot saved:", file_name))
})

# Print out download url
write(urls, stdout())
