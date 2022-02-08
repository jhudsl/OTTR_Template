#!/usr/bin/env Rscript

library(magrittr) 

# Find .git root directory
root_dir <- rprojroot::find_root(rprojroot::has_dir(".github"))

# Load in what the on trigger criteria is
on_triggers <- yaml::yaml.load_file(file.path(root_dir, ".github", "triggers.yml"))

# Get github actions directory
github_actions_dir <- file.path(root_dir, ".github", "workflows")

# Get list of github actions files
github_actions_files <- list.files(github_actions_dir, pattern = "\\.yml$", 
                                   full.names = TRUE)

config_yaml <- yaml::read_yaml(file.path(root_dir, "config_automation.yml")) %>% 
  data.frame() %>% 
  t() %>% 
  data.frame() %>%
  tibble::rownames_to_column("gha_file")

colnames(config_yaml)[2] <- "on_or_off"

gha_file <- github_actions_files[1]

# Read in all files
all_gha <- lapply(github_actions_files, function(gha_file) {
  yaml_contents <- yaml::yaml.load_file(gha_file)

  yaml_contents$
  if ()
  yaml_contents$`TRUE` <- on_triggers[[basename(gha_file)]]
  
  yaml::write_yaml(yaml_contents, sync_file_path)
})
