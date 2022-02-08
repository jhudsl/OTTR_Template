# Write on-trigger yaml
# This script stores what the 'on' triggers look like for each github action

# Find .git root directory
root_dir <- rprojroot::find_root(rprojroot::has_dir(".github"))

# Get github actions directory
github_actions_dir <- file.path(root_dir, ".github", "workflows")

# Get list of github actions files
github_actions_files <- list.files(github_actions_dir, pattern = "\\.yml$", 
                                   full.names = TRUE)

# Read in all files
all_gha <- lapply(github_actions_files, readLines)
names(all_gha) <- basename(github_actions_files)

# Make extract trigger function
extract_trigger <- function(gha_contents) {
  # Extract trigger criteria
  trigger_start <- grep("TRIGGER-START", gha_contents)
  trigger_end <- grep("TRIGGER-END", gha_contents)

  return(gha_contents[trigger_start:trigger_end])
}

on_triggers <- lapply(all_gha, extract_trigger)

readr::write_rds(on_triggers, file.path(root_dir, ".github", "on-triggers.rds"))
