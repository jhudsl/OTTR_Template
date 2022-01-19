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
    default = "jhudsl/OTTR_Template_Test",
    help = "GitHub repository name, e.g. jhudsl/OTTR_Template",
  )
)

# Read the arguments passed
opt_parser <- optparse::OptionParser(option_list = option_list)
opt <- optparse::parse_args(opt_parser)

# Find .git root directory
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

# Get test sync yaml path
sync_file_path <- file.path(root_dir, ".github", "test-sync.yml")

yaml_contents <- yaml::yaml.load_file(sync_file_path)

# Switch out repo 
yaml_contents$group$repos <- opt$repo

yaml::write_yaml(yaml_contents, sync_file_path)

