#!/usr/bin/env Rscript
#
# When given a Publishes to a Leanpub book
#
# Candace Savonen - jhudsl
# 2021
#
# Command line example:
#
# Rscript scripts/preview-leanpub.R \
# -s jhu/jhudsl_course_template \
# -a BLAHBLAHBLAH


# Establish base dir
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

# Load library:
library(optparse)

#--------------------------------Set up options--------------------------------#
# Set up optparse options
option_list <- list(
  make_option(
    opt_str = c("-s", "--slug"), type = "character",
    default = NULL, help = "Supply your Leanpub slug. Example: jhu/jhudsl_course_template",
    metavar = "character"
    ),
  make_option(
    opt_str = c("-a", "--api_key"), type = "character",
    default = NULL, help = "Supply your Leanpub API key. Can find it here: https://leanpub.com/user_dashboard/api_key",
    metavar = "character"
  ),
  make_option(
    opt_str = c("--publish"), action = "store_true",
    default = FALSE, help = "If TRUE, will publish to Leanpub. Default it so make a preview only.",
    metavar = "character"
  )
)

# Parse options
opt <- parse_args(OptionParser(option_list = option_list))

# Publish if --publish was used, otherwise do a preview
if (opt$publish) {
  # Publish it!
  leanpubr::lp_publish(opt$slug, api_key = opt$api_key)
} else {
  # Do a preview
  leanpubr::lp_preview(opt$slug, api_key = opt$api_key)
}
