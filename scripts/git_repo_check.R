#!/usr/bin/env Rscript

# Written by Candace Savonen Sept 2021

repo <- commandArgs(trailingOnly = TRUE)
repo <- "jhudsl/DaSL_Course_Template_Bookdown"

check_git_repo <- function(repo, silent = TRUE, return_repo = FALSE) {
  # Given a repository name, check with git ls-remote whether the repository 
  # exists and return a TRUE/FALSE
  
  # Inputs: 
  # repo: the name of the repository, e.g. jhudsl/DaSL_Course_Template_Bookdown
  # silent: TRUE/FALSE of whether the warning from the git ls-remote command 
  #         should be echoed back if it does fail.
  # return_repo: TRUE/FALSE of whether or not the output from git ls-remote 
  #              should be saved to a file (if the repo exists)
  
  # Returns: 
  # A TRUE/FALSE whether or not the repository exists. 
  # Optionally the output from git ls-remote if return_repo = TRUE. 
  
  message(paste("Checking for remote git repository:", repo))

  # If silent = TRUE don't print out the warning message from the 'try'
  report <- ifelse(silent, suppressWarnings, message)

  # Try to git ls-remote the repo given
  test_repo <- report(
    try(system(paste0("git ls-remote https://github.com/", repo),
              intern = TRUE, ignore.stderr = TRUE))
    )

  # If 128 is returned as a status attribute it means it failed
  exists <- ifelse(is.null(attr(test_repo, "status")), TRUE, FALSE)
                 
  if (return_repo && exists) {
    # Make file name
    output_file <- paste0("git_ls_remote_", gsub("/", "_", repo))
    
    # Tell the user the file was saved
    message(paste("Saving output from git ls-remote to file:", output_file))
    
    # Write to file
    writeLines(exists, file.path(output_file))
  }

  return(exists)
}

# Print out the result
write(check_git_repo(repo), stdout())
