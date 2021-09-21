#!/usr/bin/env Rscript

# This code was originally written by Josh Shapiro and Candace Savonen
# for the Childhood Cancer Data Lab an initiative of Alexs Lemonade Stand Foundation.
# https://github.com/AlexsLemonade/refinebio-examples/blob/33cdeff66d57f9fe8ee4fcb5156aea4ac2dce07f/.github/workflows/style-and-sp-check.yml#L1

# Adapted for this jhudsl repository by Candace Savonen Apr 2021

# Run spell check and save results

library(magrittr)

# Find .git root directory
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

# Read in dictionary
dictionary <- readLines(file.path(root_dir, 'resources', 'dictionary.txt'))

# Add mysterious emoji joining character
dictionary <- c(dictionary, spelling::spell_check_text("⬇️")$word)

# Only declare `.Rmd` files
files <- list.files(pattern = 'Rmd$', recursive = TRUE, full.names = TRUE)
files <- grep("About.Rmd", files, ignore.case = TRUE, invert = TRUE, value = TRUE)

# Run spell check
sp_errors <- spelling::spell_check_files(files, ignore = dictionary) %>%
  data.frame() %>%
  tidyr::unnest(cols = found) %>%
  tidyr::separate(found, into = c("file", "lines"), sep = ":")

# Print out how many spell check errors
write(nrow(sp_errors), stdout())

# Save spell errors to file temporarily
readr::write_tsv(sp_errors, 'spell_check_results.tsv')
