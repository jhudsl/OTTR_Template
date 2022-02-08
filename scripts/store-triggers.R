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
all_gha <- lapply(github_actions_files, yaml::yaml.load_file)
names(all_gha) <- basename(github_actions_files)

# Extract trigger criteria
gha_triggers <- lapply(1:length(all_gha), function(gha) purrr::pluck(all_gha, gha, "TRUE"))
names(gha_triggers) <- basename(github_actions_files)


yaml::write_yaml(gha_triggers, file.path(root_dir, ".github", "gha-triggers.yml"))