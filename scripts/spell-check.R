#!/usr/bin/env Rscript
#
# Run spell check and save results

library(magrittr)

# Find .git root directory
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

# Read in dictionary
dictionary <- readLines(file.path(root_dir, 'components', 'dictionary.txt'))

# Add mysterious emoji joining character
dictionary <- c(dictionary, spelling::spell_check_text("⬇️")$word)

# Only declare `.Rmd` files
files <- list.files(pattern = 'Rmd$', recursive = TRUE, full.names = TRUE)

# Remove the template from the spell check 
files <- grep('template_example.Rmd', files, invert = TRUE, value = TRUE)

# Run spell check
sp_errors <- spelling::spell_check_files(files, ignore = dictionary) %>%
  data.frame() %>%
  tidyr::unnest(cols = found) %>%
  tidyr::separate(found, into = c("file", "lines"), sep = ":")

# Print out how many spell check errors
write(nrow(sp_errors), stdout())

# Save spell errors to file temporarily
readr::write_tsv(sp_errors, 'spell_check_results.tsv')
