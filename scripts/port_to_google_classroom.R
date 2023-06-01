#!/usr/bin/env Rscript

# This script takes information about the curriculum that is set up into a dataframe by `make_material_df.R`
# and it ports all info to a Google Classroom using rgoogleclassroom

library(magrittr)
library(lubridate)


# Find .git root directory
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

curriculum_df <- googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/14PRS2qEed3E636QsorJFkgN94ikj3SeF1AgpoC-0bo0/edit#gid=971038940",
  sheet = "chapter_df"
)


### Figure out a rough schedule  
total_units <- sum(curriculum_df$unit_time)

### 5 days a week * 15 weeks 
number_of_days <- 5*15

units_per_day <- round(total_units/number_of_days)

### Set up rough schedule
start_date <- ymd("2023-07-03")
due_date_time <- hms("11:59:59")

dist_from_tues <- 3 - wday(start_date)
dist_from_thurs <- 5 - wday(start_date)

# We want due dates on the same 
gaps <- seq(from = 0, to = 7*15, by = 7)

tuesdays <- start_date + dist_from_tues + days(gaps)
thursdays <- start_date + dist_from_thurs  + days(gaps)

# Make a due_date column 
curriculum_df <- curriculum_df %>% 
  dplyr::mutate(unit_period = cumsum(unit_time))

sum(curriculum_df$unit_time)/length(thursdays)

which(abs(x - your.number) == min(abs(x - your.number)))


###### Create a new course
devtools::load_all("../../Hutch/rgoogleclassroom")

authorize()
owner_id <- get_owner_id()
datatrail_course <- create_course(owner_id$id, name = "DataTrail")

#### Create topics
topic_ids <- lapply(unique(curriculum_df$topic), function(topic_name) {
  topic_output <- create_topic(course_id = datatrail_course$id, 
               name = topic_name)
  return(topic_output$topicId)
})

# Add topic_ids
curriculum_df <- curriculum_df %>% dplyr::inner_join(
  data.frame(topic = unique(curriculum_df$topic), topic_id = unlist(topic_ids))
)
       

#### Create materials 
material_prompt <- "Read this material at this link below before taking the next quiz."

chapter_df <- curriculum_df %>% 
  dplyr::filter(type == "Chapter") %>% 
  dplyr::select(topic_id, chapt_title, full_urls)

material_results <- purrr::pmap(chapter_df, function(topic_id, chapt_title, full_urls) {
  create_material(course_id = datatrail_course$id,
                  topic_id = topic_id, 
                  title = chapt_title, 
                  link = full_urls, 
                  description = material_prompt)
}) 

#### Create quizzes
quiz_assignment_prompt <- "Take the attached quiz! Remember to use the same email."
quiz_description_prompt <- "Answer the following questions after having read the chapters"

# Filter to only quizzes
quiz_df <- curriculum_df %>% 
  dplyr::filter(!is.na(quiz_file)) %>%
  dplyr::select(quiz_file, topic_id, chapt_title)

# Convert quizzes to correct format
dir.create("quiz_jsons", showWarnings = FALSE)  
  
convert_quizzes <- purrr::pmap(quiz_df[62:nrow(quiz_df), ], function(quiz_file, topic_id, chapt_title) {
  ottr_quiz_to_google(course_id = datatrail_course$id,
                      quiz_path = file.path("quizzes", quiz_file),
                      form_id = "https://docs.google.com/forms/d/1eSCaKC7GDFsm60AKOWYHXK_yXCbrQbR-r2PomeKC_VY/edit",
                      topic_id = topic_id,
                      quiz_title = chapt_title,
                      new_name = chapt_title,
                      coursework_title = paste0("Quiz:", chapt_title),
                      due_date = "2025-5-1",
                      copy_from_template_quiz = TRUE,
                      quiz_description = quiz_description_prompt, 
                      assignment_description = quiz_assignment_prompt,
                      output_path = file.path("quiz_jsons", gsub("\\.md$", ".json", quiz_file)))
})
  

### Set up Projects 
# Put together the prompts
project_prompt <- readLines(file.path(root_dir, "scripts", "prompts", "project_prompt.md"))
project_prompt <- paste0(project_prompt, sep = "\n", collapse = "")

# Filter to only projects
project_df <- curriculum_df %>% 
  dplyr::filter(type == "Project") %>%
  dplyr::select(topic_id, chapt_title)

# Set up data
folders_df <- data.frame(
  folder_name =
    c(
      "01_Forming_Questions",
      "02_Getting_Data",
      "03_Cleaning_Data",
      "04_Plotting_Data",
      "05_Getting_Stats",
      "06_Sharing_Results"
    ),
  rmd_name = c(
    "first_project.Rmd",
    "leanpub_project.Rmd",
    "countries_project.Rmd",
    "airbnb_project.Rmd",
    "countries_stats_project.Rmd",
    "data_project_final.Rmd"
  )
)

# Add the folder and Rmd names
project_df <- dplyr::bind_cols(project_df, folders_df) 

create_projects <- purrr::pmap(project_df, function(topic_id, chapt_title, folder_name, rmd_name) {
  
  # Fill in the blanks
  project_description <- stringr::str_replace_all( project_prompt, "\\{FOLDER_NAME\\}", folder_name)
  project_description <- stringr::str_replace_all(project_description, "\\{RMARKDOWN_NAME\\}", rmd_name)
  
  result <- create_coursework(course_id = datatrail_course$id, 
                    topic_id = topic_id,
                    title = paste("Project:", folder_name),
                    due_date = "2025-12-1",
                    description = project_description,
                    link = "https://posit.cloud/spaces/3919/content/4475631"
                    )
  return(result)
})


#### Set up Swirl

# Put together the prompts
swirl_prompt <- readLines(file.path(root_dir, "scripts", "prompts", "swirl_prompt.md"))
swirl_prompt <- paste0(swirl_prompt, sep = "\n", collapse = "")

# Filter to only projects
swirl_df <- curriculum_df %>% 
  dplyr::filter(!is.na(module_name)) %>%
  dplyr::select(topic_id, module_name, topic)

module_df <- data.frame(modules = c(
  "DataTrail_01_Forming_Questions",
  "DataTrail_02_Getting_Data",
  "DataTrail_03_Cleaning_Data",
  "DataTrail_04_Plotting_Data",
  "DataTrail_05_Getting_Stats",
  "DataTrail_06_Sharing_Results")) %>% 
  dplyr::mutate(topic = stringr::word(modules, sep = "_", start = -2, end = -1), 
                topic = gsub("_", " ", topic), 
                # I have to do this stupid thing because the topic is called 'Stats' and the module is called 'Statistics'
                topic = gsub("Stats$", "Statistics", topic))

# Join the module names to the swirl_df
swirl_df <- dplyr::left_join(swirl_df, module_df, by = "topic") %>% 
  dplyr::select(-topic)


# Create the swirl assignments
create_swirls <- purrr::pmap(swirl_df, function(topic_id, module_name, modules) {
  
  # Fill in the blanks
  swirl_description <- stringr::str_replace_all(swirl_prompt, "\\{LESSON_NAME\\}", module_name)
  swirl_description <- stringr::str_replace_all(swirl_description, "\\{COURSE_NAME\\}", modules)
  
  result <- create_coursework(course_id = datatrail_course$id, 
                              topic_id = topic_id,
                              title = paste("Swirl:", gsub("_", " ", module_name)),
                              due_date = "2025-12-1",
                              description = swirl_description,
                              link = "https://posit.cloud/spaces/3919/content/4475631"
  )
  return(result)
})
