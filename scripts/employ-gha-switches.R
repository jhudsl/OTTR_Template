#!/usr/bin/env Rscript

library(magrittr)

option_list <- list(
  optparse::make_option(
    c("--overwrite"),
    action = "store_true",
    default = FALSE,
    help = "TRUE or FALSE overwrite the trigger no matter what",
  )
)

# Read the arguments passed
opt_parser <- optparse::OptionParser(option_list = option_list)
opt <- optparse::parse_args(opt_parser)


# Find .git root directory
root_dir <- rprojroot::find_root(rprojroot::has_dir(".github"))

######## Load in triggers
# Each github action has its own on and off trigger versions which are stored
# in this file -- if triggers need to be altered, they must be altered in this file to take effect
trigger_config <- yaml::yaml.load_file(file.path(root_dir, ".github", "gha-triggers.yml"))

######## Get the github actions file paths
# Get github actions directory
github_actions_dir <- file.path(root_dir, ".github", "workflows")

# Get list of github actions files
github_actions_files <- list.files(github_actions_dir,
  pattern = "\\.yml$",
  full.names = TRUE
)

######## Set up dataframe with information about the GHA 
gha_df <- data.frame(gha_files = names(trigger_config))

# Read in the configuration file with the specs
config_df <- 
  yaml::read_yaml(file.path(root_dir, "config_automation.yml")) %>%
  data.frame() %>%
  t() %>%
  data.frame() %>%
  tibble::rownames_to_column("gha_files") %>%
  dplyr::rename(new_status = '.') %>% 
  dplyr::mutate(gha_files = paste0(gsub("\\.", "-", gha_files), ".yml"))

# Extract the "dependent on" information
dependent_on_df <- data.frame(dependent_on = unlist(trigger_config)[grep("dependent_on", names(unlist(trigger_config)))], 
                           gha_files = gsub("\\.dependent_on$", "", grep("dependent_on", names(unlist(trigger_config)), value = TRUE)))

# For GHA dependent on other ones, switch their status based on what the new status is
dependent_on_df$recoded_status <- config_df$new_status[match(dependent_on_df$dependent_on, config_df$gha_files)]

# Put it all together
gha_df <- gha_df %>% 
  dplyr::left_join(config_df) %>% 
  dplyr::left_join(dependent_on_df) %>% 
  dplyr::mutate(new_status = dplyr::case_when(
    !is.na(recoded_status) ~ recoded_status, 
    TRUE ~ new_status)
  ) 

config_gha <- function(gha_file) {

  # Read in this GHA yaml
  yaml_contents <- readLines(gha_file)

  # Get info about this particular GHA
  trigger_info <- trigger_config[[basename(gha_file)]]

  # Extract what the status should be
  new_status <- gha_df %>%
    dplyr::filter(basename(gha_file) == gha_files) %>%
    dplyr::pull("new_status")

  # If status specified in the config_automation.yml continue
  if (!is.na(new_status) && length(new_status) == 1) {

    # If current status doesn't match specified status
    # and it wasn't specified to overwrite anyway...
    if ((new_status != trigger_info$status) || opt$overwrite) {

      # Output message
      message(paste("Switching trigger for", basename(gha_file), "to", new_status))

      # Get trigger for whether this should be on or off
      trigger <- ifelse(new_status, trigger_info[["on-trigger"]], trigger_info[["off-trigger"]])

      # Make sure it has `on:` at the beginning
      trigger$on <- trigger
      trigger <- trigger[-1]
      
      # Temporarily write to yaml so we can read in as plain text 
      yaml::write_yaml(trigger, "tmp-trigger.yml")

      # Find out where this trigger is supposed to go
      trigger_indices <- (grep("TRIGGER-START", yaml_contents) + 1):(grep("TRIGGER-END", yaml_contents) - 1)
      
      # Remove current trigger
      yaml_contents <- yaml_contents[-trigger_indices]

      # Set up new yaml trigger
      trigger_text <-  gsub("\\'on\\':", "on:", readLines("tmp-trigger.yml"))
      
      # Put new trigger in
      yaml_contents <- append(
        yaml_contents, 
        trigger_text,
        after = trigger_indices[1] - 1
      )

      # Remove temporary file
      file.remove("tmp-trigger.yml")
      
      # Write lines to file
      writeLines(yaml_contents, gha_file)
    }
  }
}

# Read in all files
all_gha <- lapply(github_actions_files, config_gha)
