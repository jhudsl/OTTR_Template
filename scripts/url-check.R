#!/usr/bin/env Rscript

# Adapted for this jhudsl repository by Candace Savonen Mar 2022

# Summarize url checks

library(magrittr)

# Find .git root directory
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

# Read in dictionary
url_checks <- readr::read_csv(file.path(root_dir, 'resources', 'url_checks.csv'))

if (nrow(url_checks) > 0) {
  url_checks <- url_checks %>%
    data.frame() %>%
    dplyr::filter(RESULT == "failed")
}

# Print out how many spell check errors
write(nrow(url_checks), stdout())

if (nrow(url_checks) > 0) {
# Save spell errors to file temporarily
readr::write_csv(url_checks, file.path('resources', 'url_checks.csv'))
}
