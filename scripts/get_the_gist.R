# Handle Gists!

library(magrittr)

# Find .git root directory
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

option_list <- list(
  optparse::make_option(
    opt_str = c("--gist_key"),
    type = "character",
    default = NULL,
    help = "The key for what the spell check file for this pull request and repository is 
    In github actions will be: e.g. ${{ github.repository }}_spell_check_${{ github.event.pull_request.number }}",
  ), 
  optparse::make_option(
    c("--file"),
    type = "character",
    default = NULL,
    help = "The file to be stored in the gist. Must be relative to base git repository",
  ), 
  optparse::make_option(
    opt_str = "--delete", type = "character",
    default = "FALSE", help = "Needs a 'TRUE/FALSE' whether the gist should be deleted after we find it"
  ),
  optparse::make_option(
    c("--git_pat"),
    type = "character",
    default = NULL,
    help = "GitHub personal access token stored in a text file",
  ), 
  optparse::make_option(
    opt_str = c("-v", "--verbose"), type = "character",
    default = "FALSE", help = "Needs a 'TRUE/FALSE' whether more messages should be printed"
  )
)

# Read the arguments passed
opt_parser <- optparse::OptionParser(option_list = option_list)
opt <- optparse::parse_args(opt_parser)
opt$delete <- as.logical(opt$delete)
opt$verbose <- as.logical(opt$verbose)
opt$file <- file.path(root_dir, opt$file)


if (!file.exists(opt$file) && !opt$delete) {
  stop(paste("Specified file:", opt$file, "does not exist"))
}

# Make sure we can login before we continue
system(paste("gh auth login --with-token <", opt$git_pat))

get_the_gist <- function(user = "jhudsl-robot",
                         verbose = TRUE) {
  
  # Declare URL
  url <- paste0("https://api.github.com/users/", user, "/gists?per_page=1000000")
  
  # Github api get
  response <- httr::GET(
    url,
    httr::accept_json()
    )
  
  if (httr::http_error(response)) {
    warning(paste0("url: ", url, " failed"))
  }
  
  # Get content as JSON
  gists <- httr::content(response, as = "parsed")
  
  
  description_key <- unlist(gists)[grep("description", names(unlist(gists)))]
  id <- unlist(gists)[grep("^id$", names(unlist(gists)))]
  gist_urls <- unlist(gists)[grep("files.spell_check_results.tsv.raw_url", names(unlist(gists)))]

  gists_df <- data.frame(description_key, id, gist_urls)
  
  return(gists_df)
}

gist_df <- get_the_gist()


if (nrow(gist_df) < 1 ){
  if (opt$verbose) warning("No gists found at all")
  gist_target <- gist_df
} else {
  gist_target <- gist_df %>% 
    dplyr::filter(description_key == opt$gist_key)
}

if (nrow(gist_target) < 1 ) {
  # If gist is not found:
  if (opt$verbose) message(paste0("No gists match the key:", opt$gist_key))
  if (opt$delete) {
    # Warn that there isn't anything to delete
    warning("No gist to delete.") 
  } else {
    # Create it
    message(paste("Creating gist:", opt$gist_key))
    system(paste("gh gist create --public", opt$file, "-d", opt$gist_key))
  }
} else {
  # If gist is found:
  if (opt$delete) {
    # Delete it 
    message(paste("Deleting gist:", opt$gist_key))
    system(paste("gh gist delete", gist_target$id))
  } else {
    # Or update it
    message(paste("Updating gist:", opt$gist_key))
    system(paste("gh gist edit", gist_target$id, "-f", opt$file, "--add", opt$file))    
  }
}


if (!opt$delete) {
  # Print out the url
  gist_target <- get_the_gist() %>% 
      dplyr::filter(description_key == opt$gist_key) %>% 
      dplyr::pull(gist_urls)

  write(gist_target, stdout())
}

