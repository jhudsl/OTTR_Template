#!/usr/bin/env Rscript

library(optparse)

################################ Set up options ################################
# Set up optparse options
option_list <- list(
  make_option(
    opt_str = c("-p", "--packages"), type = "character",
    default = NULL,
    help = "A list of packages to be installed through Github, separated by commas:
    ",
    metavar = "character"
  ),
  make_option(
    opt_str = c("--token"), type = "character",
    default = NULL,
    help = "GITHUB PAT file",
    metavar = "character"
  )
)

# Parse options
opt <- parse_args(OptionParser(option_list = option_list))

# Read in the token
token <- as.character(readLines(opt$token)[1])

# set up list of packages to install
opt$packages <- unlist(strsplit(opt$packages, ", "))

# We want errors not just warnings
remotes::install_github(opt$packages,
                        auth_token = token)

# Remove the file after we are done
file.remove(opt$token)
