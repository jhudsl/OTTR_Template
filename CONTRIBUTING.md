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

## Spell check

TODO: Can have github actions run this for us.

## Style guide

TODO: Are there any standards we wanna keep to

### Adding Images and Graphics

To maintain style and attributions for graphics and images, as well as to enable easy updates in the future, please start a new Google Slide document for your course and import this the theme from this [template](https://docs.google.com/presentation/d/1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU/edit?usp=sharing).

See [this video](https://youtu.be/pNbwF263yY8) for assistance on how to import themes. 

Please select the layout that looks like this for any content from outside sources:

![](https://docs.google.com/presentation/d/1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU/edit#slide=id.gcf0c1d8548_0_146)

Please update the text at the bottom to describe the source.

For any major point, please select this layout:

![](https://docs.google.com/presentation/d/1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU/edit#slide=id.gcf0c1d8548_0_136)

For itemized lists, please select this layout:

![](https://docs.google.com/presentation/d/1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU/edit#slide=id.gcf0c1d8548_0_141)

Once complete, your slides can be downloaded and a static version can be added to your bookdown and or Leanpub repository to build your course. See [this link](https://www.howtogeek.com/509046/how-to-save-google-slides-objects-as-images/) for information on how to download slides from Google Slides.

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


