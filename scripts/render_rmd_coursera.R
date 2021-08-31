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
    help = "File name of the references file. Can be any format pandoc works with. Will be normalized with normalizePath().",
    metavar = "character"
  ),
  make_option(
    opt_str = c("--cite_style"),
    type = "character",
    default = NULL,
    help = "File name of the citation style file, csl format. Will be normalized with normalizePath().",
    metavar = "character"
  ),
  make_option(
    opt_str = c("-o", "--html"), type = "character",
    default = NULL,
    help = "Desired filename for rendered output html file",
    metavar = "character"
  ),
  make_option(
    opt_str = c("-s", "--style"), action = "store_true",
    default = FALSE,
    help = "Style input file before processing"
  ),
  make_option(
    opt_str = c("-i", "--include_file"), type = "character",
    default = NULL,
    help = "File with R code to include for rendering"
  )
)

# Parse options
opt <- parse_args(OptionParser(option_list = option_list))

# Get working directory
base_dir <- getwd()

# Check that the rmd file exists
if (!file.exists(opt$rmd)) {
  stop("Rmd file specified with --rmd is not found.")
}

# Check that the bib file exists
header_line <- paste0(
    "bibliography: ", opt$bib_file, "\n",
    "link-citations: TRUE")

# Check for a citation style
if (!is.null(opt$cite_style)){
  if (!file.exists(opt$cite_style)) {
    stop("File specified for --cite_style option is not at the specified file path.")
  } else {
    header_line <- paste0(header_line, "\n", "csl: ", normalizePath(opt$cite_style))
  }
}

# Check for an R code inclusion file and create a chunk to source it
if (!is.null(opt$include_file)){
  if (!file.exists(opt$include_file)) {
    stop("File specified for --include_file option is not at the specified file path.")
  } else {
    # create a hidden chunk to source the include file
    include_chunk <- paste0(
      '```{r, include = FALSE}\n',
      'source("', normalizePath(opt$include_file), '")\n',
      '```'
    )
    
  }
}

# If no output html filename specification, make one from the original filename
if (is.null(opt$html)) {
  output_file <- stringr::str_replace(normalizePath(opt$rmd), "\\.Rmd$", ".html")
} else {
  # Render is weird about relative file paths, so we have to do this
  output_file <- file.path(base_dir, opt$html)
}

# Run styler if option is used
if (opt$style) {
  styler::style_file(opt$rmd)
}

# Specify the temp file
tmp_file <- stringr::str_replace(opt$rmd, "\\.Rmd$", "-tmp-torender.Rmd")

# Read in as lines
lines <- readr::read_lines(opt$rmd)

# Remove the set knit image path function
# lines <- stringr::str_remove_all(lines, "leanbuild::set_knitr_image_path\\(\\)") 

# Find which lines are the beginning and end of the header chunk
header_range <- which(lines == "---")

# Stop if no header found
if (length(header_range) < 2) {
  stop("Not finding the `---` which are at the beginning and end of the header.")
}


# Add the include chunk after the header
if (!is.null(opt$include_file)){
  lines <- append(lines, include_chunk, header_range[2])
}

# Add the bibliography specification line at the beginning of the chunk
new_lines <- append(lines, header_line, header_range[1])

# Write to a tmp file
readr::write_lines(new_lines, tmp_file)

# Declare path to footer
footer_file <- normalizePath(file.path("assets", "footer.html"))

# Declare path to css

# If an not an ITCR course, use this css file: 
# css_file <- normalizePath(file.path("assets", "style_coursera.css"))

# If an ITCR course, use this css file: 
css_file <- normalizePath(file.path("assets", "style_ITN_coursera.css"))

# Render the modified notebook
rmarkdown::render(tmp_file,
                  output_format = rmarkdown::html_document(
                    number_sections = TRUE,
                    highlight = "haddock",
                    df_print = "paged",
                    css = css_file,
                    includes = rmarkdown::includes(after_body = footer_file)
                  ),
                  # Save to html output file name
                  output_file = output_file
)

# Remove the modified .Rmd tmp file
file.remove(tmp_file)