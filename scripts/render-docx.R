#!/usr/bin/env Rscript

files <- list.files(pattern = "\\.Rmd$")

# We don't want to render these files to a word-compatible format
files <-
  files[!files %in% c("About.Rmd", "index.Rmd", "index-itcr.Rmd", "References.Rmd")]

for(file in files){
  rmarkdown::render(file, output_format = "word_document")
  }
  