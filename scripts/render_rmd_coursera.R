#!/usr/bin/env Rscript
# Adapted from https://github.com/AlexsLemonade/refinebio-examples/blob/staging/scripts/render-notebooks.R
#
# C. Savonen 2021
#
# Make rendered versions of .Rmd files with automagic citations with a specified
# .bib file.

# Example use:

# Rscript scripts/render-notebooks.R \
# -r 01-getting-started/getting-started.Rmd \
# -b "[book.bib, packages.bib]" \
# --style

# Load library:
library(optparse)

# Set up optparse options
option_list <- list(
  make_option(
    opt_str = c("-r", "--rmd"), type = "character",
    default = NULL,
    help = "File path to an .Rmd file that should have the bib_file added",
    metavar = "character"
  ),
  make_option(
    opt_str = c("-b", "--bib_file"),
    type = "character",
    default = c("[book.bib, packages.bib]"), # Default is this file, but it can be changed
    help = "File name of the references file. Can be any format pandoc works with.",
    metavar = "character"
  ),
  make_option(
    opt_str = c("--css_file"),
    type = "character",
    default = file.path("assets", "style_coursera.css"), # Default is this file, but it can be changed
    help = "File name of the CSS style file to be used.",
    metavar = "character"
  ),
  make_option(
    opt_str = c("--output_dir"), type = "character",
    default = getwd(),
    help = "Desired location for output html",
    metavar = "character"
  ),
  make_option(
    opt_str = c("-s", "--style"), action = "store_true",
    default = FALSE,
    help = "Style input file before processing"
  )
)

# Parse options
opt <- parse_args(OptionParser(option_list = option_list))

# Check that the rmd file exists
if (!file.exists(opt$rmd)) {
  stop("Rmd file specified with --rmd is not found.")
}

if (!file.exists(opt$css_file)) {
  stop("CSS file specified with --css_file is not found.")
}

# Build the header
header_line <- paste0(
    "bibliography: ", opt$bib_file, "\n",
    "link-citations: TRUE \n",
    "output: \n",
    "    html_document: \n",
    "        css: \"", opt$css_file, "\"")


# Check if the output_dir exist, otherwise create it
if (!dir.exists(opt$output_dir)) {
  dir.create(opt$output_dir)
}

# Run styler if option is used
if (opt$style) {
  styler::style_file(opt$rmd)
}

# Read in as lines
lines <- readr::read_lines(opt$rmd)

# Find which lines are the beginning and end of the header chunk
header_range <- which(lines == "---")

# Stop if no header found
if (length(header_range) < 2) {
  stop("Not finding the `---` which are at the beginning and end of the header.")
}

# Set up file path to temporary file
tmp_file <- file.path(opt$output_dir,
                      stringr::str_replace(opt$rmd, "\\.Rmd$", "-tmp-torender.Rmd"))

# Add new header specification line at the beginning of the chunk
new_lines <- append(lines, header_line, header_range[1])

# Write to a tmp file
readr::write_lines(new_lines, tmp_file )

# Render the modified notebook
render_filename <- rmarkdown::render(tmp_file)

# Remove the temporary file
file.remove(tmp_file)
