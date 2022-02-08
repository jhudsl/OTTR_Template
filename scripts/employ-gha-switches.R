#!/usr/bin/env Rscript

library(magrittr) 

# Make extract trigger function
extract_trigger <- function(gha_contents) {
  # Extract trigger criteria
  trigger_start <- grep("TRIGGER-START", gha_contents)
  trigger_end <- grep("TRIGGER-END", gha_contents)
  
  return(trigger_start:trigger_end)
}

# Find .git root directory
root_dir <- rprojroot::find_root(rprojroot::has_dir(".github"))

### Load in "on" triggers 

# Each github action has its own
on_triggers <- readr::read_rds(file.path(root_dir, ".github", "on-triggers.rds"))

# Same off trigger for all
off_trigger <- c("",
                 "#---TRIGGER-START---#", 
                 "on:", 
                 "  workflow_dispatch:", 
                 "#---TRIGGER-END----#", 
                 "")

### Read in and set up config automation yaml

# Get github actions directory
github_actions_dir <- file.path(root_dir, ".github", "workflows")

# Get list of github actions files
github_actions_files <- list.files(github_actions_dir, pattern = "\\.yml$", 
                                   full.names = TRUE)

# Set up the list of the gha
config_yaml <- yaml::read_yaml(file.path(root_dir, "config_automation.yml")) %>% 
  data.frame() %>% 
  t() %>% 
  data.frame() %>%
  tibble::rownames_to_column("gha_files") %>% 
  dplyr::mutate(gha_files = paste0(gsub("\\.", "-", gha_files), ".yml"))

colnames(config_yaml)[2] <- "on_or_off"

# Read in all files
all_gha <- lapply(github_actions_files, function(gha_file) {
  
  # Read in yaml
  yaml_contents <- readLines(gha_file)
  
  # Get trigger indices
  trigger_indices <- extract_trigger(yaml_contents)
    
  # Should this be on or off? 
  status <- config_yaml %>% 
    dplyr::filter(basename(gha_file) == gha_files) %>% 
    dplyr::pull("on_or_off")
  
  if (length(status) == 1) {
    message(paste("Turning trigger on:", status, "for", basename(gha_file)))
    if (status) {
      trigger <- on_triggers[[basename(gha_file)]]
    } else {
     trigger <- off_trigger
   }
  
  # Remove current trigger
  yaml_contents <- yaml_contents[-trigger_indices]
  
  # Put new trigger in
  yaml_contents <- append(yaml_contents, trigger, after = trigger_indices[1])
         
  writeLines(yaml_contents, gha_file)
  }
})
