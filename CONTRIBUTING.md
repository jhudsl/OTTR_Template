# Contributing Guidelines for ITCR Course Template

This template includes all of the files that you need to get started creating your course in [R Markdown](https://rmarkdown.rstudio.com/) using the [bookdown package](https://bookdown.org/) and/or Leanpub.

TODO: This will need to be revised if/when we split into separate bookdown Leanpub repositories.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*
  - [Creating your course](#creating-your-course)
  - [Setting up Docker image](#setting-up-docker-image)
    - [Starting a new Docker image](#starting-a-new-docker-image)
  - [Citations](#citations)
  - [Spell check](#spell-check)
  - [Style guide](#style-guide)
  - [Bookdown Rendering](#bookdown-rendering)
  - [Leanpub rendering](#leanpub-rendering)
    - [Hosting your course on Leanpub](#hosting-your-course-on-leanpub)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Creating your course

In the upper right of this screen, click `Use this template` and follow the steps to set up your course's GitHub repository.

TODO: Add more details here about setting up repositories.

## Setting up Docker image

Particularly for courses that involve running example code, it's recommended that you use a Docker image for development to maintain software version consistency across course developers.
If you haven't installed Docker, you can do [so here](https://docs.docker.com/get-docker/).
You will need to create a Docker account if you don't have one.

To pull the docker image associated with this template, you can run this command in your command line.

```
docker pull jhudsl/itcr_course_template
```
Alternatively, if you'd prefer to build from the Dockerfile locally you can run:

```
docker build -< docker/Dockerfile -t jhudsl/itcr_course_template
```

To use the Docker image associated with the course template, first navigate to the the top of this GitHub repository.
Now you can start up the Docker container using the command below.
Replace `password` with something else of your choosing

```
docker run -it -v $PWD:/home/rstudio -e PASSWORD=password -p 8787:8787 jhudsl/itcr_course_template
```

Now, if you run the command: `docker ps`, you should see a container is up and running!

In a web browser navigate to the following to get to an RStudio that is ran from your Docker container.
```
localhost:8787
```

You'll need to use `rstudio` as the username and whatever password you chose to log in.

### Starting a new Docker image

TODO: Add more information about how to start a new image and add packages to existing ones.

## Citations

TODO: How to add and use citations

## Style guide

Github actions will run the [`styler` package to all style R in all Rmds](https://github.com/jhudsl/ITCR_Course_Template_Bookdown/.github/workflows/style-and-sp-check.yml) whenever a pull request to the `main` branch is filed.
Style changes will automatically be committed back to your branch.

## Spell check

Github actions will automatically [run a spell check on all Rmds](https://github.com/jhudsl/ITCR_Course_Template_Bookdown/.github/workflows/style-and-sp-check.yml) whenever a pull request to the `main` branch is filed.

It will fail if there are more than 2 spelling errors and you'll need to resolve those before being able to merge your pull request.

To resolve those spelling errors, go to this repository's `Actions` tab.
Then, click on the GitHub action from the PR you just submitted.
Scroll all the way down to `Artifacts` and click `spell-check-results`.
This will download a zip file with a TSV that lists all the spelling errors.

Some of these errors may be things that the spell check doesn't recognize for example: `ITCR`.
If it's a 'word' the spell check should recognize, you'll need to add this to the dictionary.

Go to the `resources/dictionary.txt` file.
Open the file and add the new 'word' to its appropriate place (the words are in alphabetical order).
Then commit the changes to `resources/dictionary.txt` to your branch and this should make the spell check status check pass.

### Running spell check and styler manually

If you are using the [Docker container](#setting-up-docker-image), or otherwise have the `spelling` and `styler` package installed, you can run spell check and styling locally on all Rmds by running this:

```
Rscript scripts/spell-check.R
```

The spell check results file will be saved to a file called `spell_check_results.tsv`.
This file should not be pushed to the github repository (it is in the gitignore so this shouldn't happen).

### URL Checking

Github actions runs a check on all the URLs upon creating a pull request to the `main` branch.
If it fails, you'll need to go the `Actions` tab of this repository, then find the Github `check_urls` job for the last commit you just pushed. 
Click on `check_urls` and the specific step of `Check URLs` to see a print out of the URLs tested.

## Bookdown Rendering

As you modify the names of the chapters of your course and add more chapters (using the `.Rmd` files), you need to update the `_bookdown.yml` file accordingly.

For example let's say that we added another chapter and named the file `03-chapter_of_course.Rmd`. We would update our `_bookdown.yml` to look like this:

```yaml
book_filename: "ITCR_Course_Name"  
chapter_name: "Chapter "  
repo: https://github.com/jhudsl/ITCR_Course_Template/ ##Make sure you update this for your GitHub Repo!!  
rmd_files: ["index.Rmd",  
            "01-intro.Rmd",   
            "02-chapter_of_course.Rmd",   
            "03-chapter_of_course.Rmd",  ##Only this is new!
            "about.Rmd"]  
new_session: yes  
delete_merged_file: true  
language:  
  ui:  
    chapter_name: "Chapter "  
output_dir: "docs"  
```

Notice how only one line is different - the one that says `03-chapter_of_course.Rmd",`
Be careful about quotation marks: `""` as well as commas: `,`!

Once we do this we can preview the book!

You can do so by typing:
`bookdown::serve_book()` in the RStudio Console.  

You will then see a live version of your book in your RStudio viewer.

## Leanpub rendering

We also include the necessary files to allow you to get your course ready for publication on [Leanpub](https://leanpub.com/). These are located in the `manuscript` directory. When you are happy with your book using bookdown, then you just need to follow a few steps to copy the necessary files from your `docs` directory into the `manuscript` directory. The `docs` directory is auto-generated by the `bookdown` package.  You need to copy time `images` directory as well as the `.md` files.

If you are comfortable using commands like the following, you can do this in a more automated way in the RStudio terminal:

```bash
cp docs/*.md manuscript  
cp -r docs/images/ manuscript/resources/images  
```

Finally you need to modify the `Book.txt` file in the `manuscript` directory to include the `.md` files that you wish in the order that you would like. We have also included a quiz example. If you wanted two quizzes (one called `quiz_1.md` and one called `quiz_2.md`) you could duplicate and modify `quiz_1.md` for your needs and then you could make the `Book.txt` file look like this (assuming you created a chapter called `"03-chapter_of_course.Rmd"` and you wanted quiz_1 to be after `02-chapter-of_course` and quiz_2 to be after `03_chapter_of_course`:  

```
01-intro.md  
02-chapter_of_course.md  
quiz_1.md  
03-chapter_of_course.md  
quiz_2.md  
about.md  
```

Note that any `.md` files with an `#` in front of the name in the `Book.txt` file will be ignored by Leanpub. We have included an example of this in the `Book.txt` file.  

### Hosting your course on Leanpub  

To then host your course on Leanpub follow these steps:  

1) Make a Leanpub account here: https://leanpub.com/    

2) Start a course  
 - click on the 3 line menu button  
 - click the author tab on the far left
 - click Courses
 - click the text that says `create a new course`
 - fill out all the necessary information
 - select using Git and GitHub (if you work with us at JHU there is a different protocol)
 - press the `add to plan` button

 3) Preview a new version
 - click on the 3 line menu button
 - click the author tab on the far left
 - click Courses
 - click on your course name/icon
 - click "Preview New Version"
 - click `Create Preview` button

 4) Once you are ready and you like your course, you can click the "Publish New Version" instead of "Preview New Version"
