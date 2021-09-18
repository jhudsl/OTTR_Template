
Note: This is being reorganized as a [GitHub Wiki](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/wiki) go there instead.

# Contributing Guidelines for this Course Template

This template includes all of the files that you need to get started creating your course in [R Markdown](https://rmarkdown.rstudio.com/) using the [bookdown package](https://bookdown.org/).


This course template repository also has [accessory tools](#using-this-template-for-publishing-to-coursera) for publishing to [Coursera](https://www.coursera.org/) and a [companion course template repository](https://github.com/jhudsl/DaSL_Course_Template_Leanpub) for if you are interested in publishing the content on [Leanpub](https://leanpub.com/).

Please take a look at the [code of conduct](./code_of_conduct.md).

If you encounter any problems or have ideas for improvements to this template repository or this getting started guide, please [file an issue here](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/issues/new/choose)! Your feedback is very much appreciated.

_Note all materials in this template are licensed [CC-BY](https://tldrlegal.com/license/creative-commons-attribution-(cc)) and can be repurposed freely with attribution._

_Background information_:  
- If you are not familiar with Git and Github, we recommend looking through [Happy Git and GitHub for the UseR by Jenny Bryan](https://happygitwithr.com/).  
- If you aren't familiar with markdown files [this is a nice introduction](https://www.markdownguide.org/getting-started/).  
- For information on RMarkdown files: [RStudio has their lessons here](https://rmarkdown.rstudio.com/lesson-1.html).  

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Creating your course](#creating-your-course)
  - [Recommended repository settings:](#recommended-repository-settings)
    - [Set up GitHub pages](#set-up-github-pages)
      - [Set up branches](#set-up-branches)
  - [Receiving automatic mechanic updates from the original template](#receiving-automatic-mechanic-updates-from-the-original-template)
    - [How to tailor the sync PR changes:](#how-to-tailor-the-sync-pr-changes)
  - [Set up Github secrets](#set-up-github-secrets)
    - [Dockerhub related secrets](#dockerhub-related-secrets)
    - [Google Slide related secrets](#google-slide-related-secrets)
- [Setting up the Docker image](#setting-up-the-docker-image)
  - [Starting a new Docker image](#starting-a-new-docker-image)
  - [Adding packages to the Dockerfile](#adding-packages-to-the-dockerfile)
    - [Template commands for adding packages to the Dockerfile](#template-commands-for-adding-packages-to-the-dockerfile)
    - [Rebuilding the Docker image](#rebuilding-the-docker-image)
- [Citations](#citations)
- [Github actions](#github-actions)
  - [About customizing render-bookdown.yml (also called `build-all`)](#about-customizing-render-bookdownyml-also-called-build-all)
    - [For a course that will need changes to Docker image](#for-a-course-that-will-need-changes-to-docker-image)
    - [For a course that needs linking to Google Slides](#for-a-course-that-needs-linking-to-google-slides)
  - [Linking to Leanpub repository](#linking-to-leanpub-repository)
  - [Style guide](#style-guide)
  - [Spell check](#spell-check)
  - [Google Slide Github Actions](#google-slide-github-actions)
  - [Running spell check and styler manually](#running-spell-check-and-styler-manually)
  - [URL Checking](#url-checking)
  - [Adding logo](#adding-logo)
- [Setting Up Images and Graphics](#setting-up-images-and-graphics)
    - [Themes for non-ITCR projects:](#themes-for-non-itcr-projects)
    - [Themes for ITCR project:](#themes-for-itcr-project)
  - [Accessibility](#accessibility)
- [Adding images and graphics in text](#adding-images-and-graphics-in-text)
- [Adding videos in text](#adding-videos-in-text)
- [Adding embedded files to text](#adding-embedded-files-to-text)
- [Learning Objectives Formatting](#learning-objectives-formatting)
- [Bookdown Rendering](#bookdown-rendering)
- [Publishing to Coursera](#publishing-to-coursera)
  - [Setting up your Coursera course](#setting-up-your-coursera-course)
  - [Converting your files for upload to Coursera](#converting-your-files-for-upload-to-coursera)
  - [Navigating to your course on Coursera](#navigating-to-your-course-on-coursera)
    - [Adding new chapters to Coursera](#adding-new-chapters-to-coursera)
    - [Adding new quizzes to Coursera](#adding-new-quizzes-to-coursera)
      - [Converting quizzes from Leanpub format](#converting-quizzes-from-leanpub-format)
  - [Github actions for coursera](#github-actions-for-coursera)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Creating your course

In the upper right of the landing page for this repository, click the green `Use this template` button and follow the steps to set up your course's GitHub repository.

![Where is the `Use this template` button?](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/template_button.png)

Name your repository fill in a short description (If this is an ITCR course, start the repo name with `ITCR_`).

![Creating new course repository](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/creating_new_course_repo.png)

Now if you go to `Issues` you will see issues filed that you can follow to set up the new course!

![Issues to Guide you through creating the course](resouces/guides_issues.png)

We then recommend that set up a project with RStudio and connect this with your repository on GitHub.

<details> <summary> Click here to see more about creating new projects in RStudio and setting them up with Git version control. </summary>

First, to create a new project in RStudio, select File > New Project.
![Make a new project](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/new_project.png)

Select a directory for your course to live. We suggest a new directory.

![Select a directory for your new project](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/select_directory.png)

Select `New Project` for project type.

![Select project type](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/project_type.png)

If creating a new directory for your project, name the new directory and decide where it should be.

![New Project Directory](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/project_directory.png)


Go back to your new GitHub repository for the course you are creating and click on the green button on the right corner of the landing page to clone the repository.

This will pop up a window that looks like this:

![Clone the GitHub repo to work on the files on your local machine](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/clone.png)

Click the button that looks like a clip board to copy the location of your repository on GitHub.

In the terminal pane of RStudio, make sure you are in the newly created directory for your project.

Then type: `git init` and press enter.

Then type:`git clone` and paste the location of the repository that you just copied from GitHub and press enter.

Finally type: `git pull origin main` and you should see the files on GitHub populate your directory.

This will give you a message like this:

![cloning messages](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/messages.png)

Next make a new git branch in the terminal in RStudio by typing the following and replacing `branch_name` with something that makes sense for you like `update_about`: `git checkout -b branch_name`

Now you are ready to start making changes to files for the next section!

</details>

Start with the issue called `New Course - Templates to Edit`.

![Templates to Edit Guide Checklist](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/templates_to_edit.png)

_If you are creating an ITCR course:_

- Use git to delete `_output.yml` and `index.Rmd` files like so:
    `git rm _output.yml` and `git rm index.Rmd`
    This will remove these files locally and on GitHub.
- Keep the `_output-itcr.yml` and `index-itcr.Rmd` files but use git to rename them to remove the `-itcr` parts of those file names like so:
    `git mv _output-itcr.yml _output.yml` and `git mv index-itcr.Rmd index.Rmd`

_If you are creating any other courses:_

- Use Git to delete the `_output-itcr.yml` and `index-itcr.Rmd` files like so:
    `git rm _output-itcr.yml` and `git rm index-itcr.Rmd`

Now, you can go through each file (the issues have checklists to guide you) and make sure the existing Rmd template files are changed to fit your course, and delete the `code_output` folder if you do not expect to have any code output (or if you wish to call the folder something else).
There are `{}` in these files to get you started filling out information and should be deleted after you've filled them out. **Make your changes in a new branch to enable you to make a pull request with Git.** If you are unfamiliar with how to do this, please see the above section about how to set up a RStudio project with Git/GitHub.

<details> <summary>Also see here for more information about how to make changes to your files with pull requests using RStudio and Git.</summary>

To make changes to files, you can open them in Rstudio by clicking on the file name from the file pane (lower right corner).

![Open File in RStudio](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/file_pane.png)

After editing a file, make sure you save it.

Then in the terminal you can use Git for version control. Again, if you are new to Git please see this [tutorial](https://happygitwithr.com/).

However, as a brief introduction:

You can type: `git add` and the file name to stage it for commiting to GitHub. For example `git add about.Rmd`.

Then type a message about what changes you are committing to the copy on GitHub:

For example:

`git commit -m "updating the about file."`

Then type `git push`.

You will get a message about your branch the first time - you can do what git suggests. Then on GitHub you should see that new Pull Request is possible.

Click on the green button that says `Compare & pull request`.

![New pull request possible](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/pull_request.png)

Then fill out the prompt with the information about your pull request. Dont worry if some of the later sections are unclear, we will get to more of that in a bit.

![Submitting pull request](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/pull_request2.png)

When you are done click the `Create pull request` button!

The first time you shouldn't have any conflicts with the main branch, thus you should see something like this:

![Pull request output](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/pull_request3.png)

If everything looks good, you can press the `Merge pull request` button.
</details>


It is likely that you might see something like this with your pull requests which will happen if you have too many new words not in the dictionary:

![Spelling check fails](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/spell_check_fails.png)

We will discuss how to get the spelling results and fix your file in a bit, but for now you can press the merge pull request button.


Once this is done, you can start on the next issue guide checklist called `New Course - Set Repository Settings`.

### Recommended repository settings:

With your course repository set up, there are some settings recommended for development.

Using the issue guide checklist called `New Course - Set Repository Settings`, you can walk through the steps for setting up your repository as we would recommend.

![Next issues checklist for repository settings](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/guides_issues_2.png)

#### Set up GitHub pages

Go to `Settings` > `Pages`.

![Find pages settings](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/pages_settings.png)

![Change pages settings](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/change_pages_settings.png)

- Under `Source`, pick the drop down menu and pick `main` and `/docs`.  
- Then click `Save`.  
- Lastly, check the box that says `Enforce HTTPS` at the bottom of this page.   

![Enforce HTTPS](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/change_https.png)

##### Set up branches

Go to `Settings` > `Branches` and click `Add rule`.

![Add branch rule](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/branches.png)

For `Branch name pattern`, put `main`.

![Put main for branch name pattern](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/main.png)

_Protect the main branch_:  
Then check the box that says `Require pull request reviews before merging`.

_Make sure branches are updated_:  
- Check the box that says `Require status checks to pass before merging`.
- Underneath this also check the box that says `Require branches to be up to date before merging`.

![Branch settings](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/branch_settings.png)

Submit a pull request if you haven't already done so, to enable you to do the next step of establishing the branch settings.

_Use automatic spell and URL checks_:  
After the first pull request, a couple of checks will automatically happen and then appear here in settings.
Then, you can require these checks to pass before merging pull requests by returning here and selecting them - they are `url_check` and `style-n-check` they will check that the urls work and that the code is styled using the `stylr` package and that the spelling is correct using the spelling package respectively.
See the [Github Actions section](#github-actions) for more details on these.

After setting up these new branch items, click `Create` and `Save changes`.

### Receiving automatic mechanic updates from the original template

When updates are made to files that aren't specific to the course content but instead run checks and other processes in the original repository, PRs are filed automatically to any downstream repositories made from this template.

To enroll in these automatic update PRs, the new course's repository name will need to be added to [this file in the original template](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/blob/main/.github/sync.yml) where it says `#NEW REPO HERE#`.
File a pull request to make this change.
If the your new course doesn't need some of the functionality of these files or you find the automatic you can feel free to use [this guide](https://github.com/marketplace/actions/repo-file-sync-action#sync-the-same-files-to-multiple-repositories) to tailor which files you want updates for.

_Carefully review the sync PR before merging it!_
It might be that you want some of the changes from the PR but not all of them.
Each file that is updated in a sync PR is updated in its own commit.

#### How to tailor the sync PR changes:  

- If you don't want the changes from a particular file, you can always [revert that particular commit](https://git-scm.com/docs/git-revert) before merging the sync PR.    
If you will not want any updates on this file in the future, you may want to remove a file from being synced in your repo [by reconfiguring the sync file](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/blob/main/.github/sync.yml).

- If you want only some changes, but they are not on a whole file basis, you could check out the branch and make manual edits.
To checkout the branch, navigate to your own repository you should be able to run:  
```
git checkout repo-sync/DaSL_Course_Template_Bookdown/default
```

- If you don't want any of the changes you can close the PR entirely.
You may want to unenroll your repository from the [sync github actions by deleting your repo name from this file](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/blob/main/.github/sync.yml) if this will continue to be the case.

### Set up Github secrets

The Github actions that this repository uses needs four Github secrets set up.

It's important that these are set up and named exactly what they are below in order for Github actions to work correctly.

See [Github Actions section](#github-actions) for how you can customize Github actions which can change the necessity of these secrets.  

![Github secrets](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/git-secrets.png)

To set up these repository secrets, on your repository's main Github page, go to `Settings` and scroll down to see `Secrets` on the left side menu bar.

For each new secret, click the `New repository secret` button and set each as follows, clicking `Add secret` as you fill each in appropriately:  

_Name: `GH_PAT`_:  
*If you are a part of `jhudsl` organization you do not need to set these.
For `value`: Create a personal access token [following these instructions](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token#creating-a-token). Underneath `Select scopes`, check both `repo` and `workflow`.
Then copy the PAT and save as the value.

#### Dockerhub related secrets

Note these are not required if [Docker update Github actions are not turned on](#about-customizing-render-bookdownyml-also-called-build-all).
*If you are a part of `jhudsl` organization you do not need to set these.

_Name: `DOCKERHUB_USERNAME`_:  
For `value`: put your login username for https://hub.docker.com/

_Name: `DOCKERHUB_TOKEN`_:   
For `value`: put a access token for Dockerhub.
You can create this by following [these instructions](https://docs.docker.com/docker-hub/access-tokens/#create-an-access-token).

#### Google Slide related secrets

Note these steps are not required if [Google slide update Github actions are not turned on](#about-customizing-render-bookdownyml-also-called-build-all).

Before following these steps, you'll need to set up the Google slides following the [instructions here](#adding-images-and-graphics).

To set up Google Slides Github Actions, you'll need to do some set up, but you will only have to do this once.

You'll need three secrets and you'll need to run some steps in your local R/RStudio _outside of Docker_ to get some of them.

Install the package, `rgoogleslides` if you have not before.
```
install.packages("rgoogleslides")
```
Then, run the following:
It will open up a browser and ask you to sign in
```
token <- rgoogleslides::authorize()
```

There are two tokens you'll need, an `ACCESS` token and a `REFRESH` token.
Once you've run the above steps you can get these tokens by running for the `ACCESS` token:
```
token$credentials$access_token
```
and for the `REFRESH` token:
```
token$credentials$refresh_token
```

Now to set up these as Github secrets, on your repository's main Github page, go to `Settings` and scroll down to see `Secrets` on the left side menu bar.
Click the `New repository secret` button and set each as follows, clicking `Add secret` as you fill each in appropriately:  

_Name: `GOOGLE_SLIDE_ACCESS_TOKEN`_:  
For `value`: paste the output from `token$credentials$access_token` from the steps above.

_Name: `GOOGLE_SLIDE_REFRESH_TOKEN`_:  
For `value`: paste the output from `token$credentials$access_token` from the steps above.

Lastly, set your Google Slide ID:

_Name: `GOOGLE_SLIDE_ID`_:  
For `value`: set the presentation ID of your main Google Slides for this course.
Set up the Google slides following the [instructions here](#adding-images-and-graphics).
The [<presentationID> is in the URL](https://developers.google.com/slides/how-tos/overview#the_structure_of_a_presentation) of your Google Slide:
```
https://docs.google.com/presentation/d/<presentationId>/edit
```

Once you click `Save` for all of these, you should be all set.

## Setting up the Docker image

Particularly for courses that involve running example code, it's recommended that you use a Docker image for development to maintain software version consistency across course developers.

If you are new to Docker, you may find it helpful to read [Carrie Wright's explanation about what Docker is for](https://carriewright11.github.io/covid_epi/#new-to-docker).
- You will need to [sign up with a Docker account](https://hub.docker.com/) if you don't have one.  
- If you haven't installed Docker desktop (or need to update it), you can do [so here](https://docs.docker.com/get-docker/).  

If your Docker desktop is running, you should see a Docker whale in your tool bar.
On Macs, this will be on the bar on the top of your screen; in Windows, on the bottom right.

A Docker image is similar to a virtual machine - it contains preinstalled software in a preconfigured environment.
Docker images can be downloaded from DockerHub, or you can create your own.

We have created the `course_template` image as a starting point; you can download it from `jhudsl/course_template` on DockerHub using the docker pull command we have below.
To pull the docker image associated with this template, you can run this command below in your command line.
This may take a while.

```
docker pull jhudsl/course_template
```

This pulls the course_template image from Docker Hub and copies it to your computer.
It will be placed in your local collection of Docker images, managed by Docker (not in your pwd).

To use the Docker image associated with the course template, first navigate to the the top of this GitHub repository.
Now you can start up the Docker container using the command below.

This runs your local copy of the course_template image (which you downloaded from DockerHub).
The option `-v $PWD:/home/rstudio` mounts pwd (this repo) and makes it available at `/home/rstudio` within the container.
Replace all of `<CHOOSE_PASSWORD>` (including the `<` and `>`) with a password of your choosing.

_On a Mac_:  
```
docker run -it -v $PWD:/home/rstudio -e PASSWORD=<CHOOSE_PASSWORD> -p 8787:8787 jhudsl/course_template
```

_On a Windows_:  
```
docker run -it -v %CD%:/home/rstudio -e PASSWORD=<CHOOSE_PASSWORD> -p 8787:8787 jhudsl/course_template
```

Do not close this window, but you can minimize it.
Open up a new command line window and run the command: `docker ps`, you should see a container is up and running!

In a web browser navigate to the following to get to an RStudio that is ran from your Docker container.

```
localhost:8787
```

To log in, you'll need to use `rstudio` as the username and whatever password you put for `<CHOOSE_PASSWORD>` in the above command.

_Couple other handy Docker commands:_

- To stop your Docker container, run `docker ps` to obtain the docker container ID.
Then you can use that ID to run `docker stop <CONTAINER_ID>`.  
- To remove a docker image (which you may need to do from time to time to clear out space), you can run `docker image ls` to see all your current images.
Then you can run either `docker image rm <IMAGE_ID>`.  
- If you really need to clear out space, you can follow this [StackOverflow post](https://stackoverflow.com/questions/44785585/docker-how-to-delete-all-local-docker-images) on how to remove all images and all containers.  

For more info on how to use Docker, they have very [extensive documentation here](https://docs.docker.com/).

### Starting a new Docker image

Should you find that your course needs additional packages beyond what's included in the template, you should probably start a new Docker image and you'll need to do two things to get this going:

1) You need to uncomment the Docker image update [following these instructions](#for-a-course-that-will-need-changes-to-docker-image).  
2) You'll need to set up a Dockerhub account and set up Dockerhub secrets [following these instructions](#dockerhub-related-secrets).   

To start up a new Docker image for your new course, you can start with the Dockerfile in this repository and add the additional packages you need using the tips in the next section, but you'll need to change the tag.

If you wish to keep the Docker image underneath the Dockerhub `jhudsl` organization account, you'll need to be granted access to that organization -- contact one of the `jhudsl` team to have them add you.

### Adding packages to the Dockerfile

If you find you need a new package to run the code you are adding, you'll need to add the package to the `docker/Dockerfile`.

Try to keep things in alphabetical order where possible.

#### Template commands for adding packages to the Dockerfile

For R packages installed from CRAN, you can add to the running vector list of R packages.

To add an R package from Bioconductor, you can follow this kind of format:

```
RUN Rscript -e "options(warn = 2); BiocManager::install( \
  c('limma', \
    'newpackagename')

```

To add an R package from GitHub you can add a line that follows this general format (need a comma and space):

```
RUN Rscript --vanilla install_github.R \
  --packages "jhudsl/didactr, jhudsl/leanbuild, <NEW_PACKAGE>" \
```

To add a Python package, you will need to add pip3 to install Python packages using this format:
```  
RUN pip3 install \
    "somepackage==0.1.0"
```

#### Rebuilding the Docker image

When you've added a package to the Dockerfile, you'll need to check that it builds successfully before including it in a pull request.

First create a GITHUB token file by making a token and copying a pasting it into a plain text file named `docker/github_token.txt`.

Then you'll need to rebuild the docker image using this command:
```
docker build -f docker/Dockerfile . -t jhudsl/course_template
```
If it fails, often the issue is a missing dependency.
Take a look at the error messages and see if you can determine the issue with some Googling.

Once it builds successfully, you should file a PR with your Dockerfile changes.
Once the changes are accepted and merged, we'll need to push the updated image to Dockerhub using:

```
docker push jhudsl/<TAG_FOR_COURSE>
```

When you file a pull request, the Dockerfile build will be tested automatically by the [GitHub actions](#github-actions).

## Citations

You can generally follow the [Bookdown instructions about citations](https://bookdown.org/yihui/rmarkdown-cookbook/bibliography.html), but you don't need to add the additional bibliography argument at the top of the Rmds.

To add a new reference source, add to the `book.bib` file, keeping your new entry in alphabetical order.

For articles (or anything with a DOI), go to [doi2bib.org](https://www.doi2bib.org/) to get a BibTex-formatted reference.

Then copy and paste the reference to the `book.bib` file.

You can also use programs like Zotero or Endnote to export a .bib file and either combine with the `book.bib` or manage your references from there.

Other sources can be added using this template:
```
@website{citekey,
    author = {First Last},
    title = {Title},
    url  = {http://www.someurl.html},
}
```

To reference the citations in your writing follow the [bookdown instructions](https://bookdown.org/yihui/rmarkdown-cookbook/bibliography.html):

> Items can be cited directly within the documentation using the syntax @key where key is the citation key in the first line of the entry, e.g., @R-base. To put citations in parentheses, use [@key]. To cite multiple entries, separate the keys by semicolons, e.g., [@key-1; @key-2; @key-3]. To suppress the mention of the author, add a minus sign before @, e.g., [-@R-base].

See [Chapter 2](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/blob/main/02-chapter_of_course.Rmd) of the template course for examples.

## Github actions

Here's a summary of the Github actions set up in this repository.

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/GHASetUp.png)


These Github actions also work across repositories to support converting Bookdown content into formats ready for publishing on Coursera or Leanpub.

If you are only looking to use this template for creating a Bookdown course, this diagram is not as pertinent.
![Summary of publishing process](https://docs.google.com/presentation/d/18k_QN7l6zqZQXoiRfKWzcYFXNXJJEo6j4daYGoc3UcU/export/png?id=18k_QN7l6zqZQXoiRfKWzcYFXNXJJEo6j4daYGoc3UcU&pageid=ged277ddb11_3_5)


### About customizing render-bookdown.yml (also called `build-all`)

Note that `build-all` and `docker-build-test` are not something we recommend requiring for status checks because `docker-build-test` is only run if there are changes to the Dockerfile and `build-all` is only run upon the acceptance and merging of a pull request.

However for simplicity purposes there are two sections this Github action that can you keep off if you won't be making changes to the Docker image or you won't be wanting it to sync to Google Slides automatically.

#### For a course that will need changes to Docker image

If you know for sure that the course you are working on will never require Docker updates -- this may be the case if the course doesn't any interactive code as a part of the material, you can delete the Docker updating chunk or keep it commented out.

However, if you will need to make any change to the Docker image specific to the course you are working on, in the file `.github/render-bookdown.yml` you should uncomment the
`###### START OF DOCKER UPDATE CHUNK` up to the part that says `###### END OF DOCKER UPDATE CHUNK`.

This will require you to set up the [Github secrets for Docker](#dockerhub-related-secrets).

#### For a course that needs linking to Google Slides

If you know for sure that the course you are working on does not need Google Slide automatic updating, you can delete the Google Slide updating chunk or keep it commented out.

However, if you will need to make any change to the Docker image specific to the course you are working on, in the file `.github/render-bookdown.yml` you should uncomment the
`###### START OF GOOGLE SLIDE UPDATE CHUNK` up to the part that says `###### END OF GOOGLE SLIDE UPDATE CHUNK`.

This will require you to set up the [Github secrets for Google Slides](#google-slide-related-secrets).

### Linking to Leanpub repository

`transfer-rendered-files.yml` is a Github action that will copy over the output `docs/` files rendered by Bookdown to a parallel `Leanpub` repository.

Once `build-all` is run, the `docs/` folder where the rendered files are place are copied over to the Leanpub repository and filed as a pull request.

There are two edits to `.github/workflow/transfer-rendered-files.yml` that need to be done to turn on the automatic copying of files between these repos:  

1) Change line 28 to the repository name you would like the `docs/` files to be transferred to.
```
repository: jhudsl/Course_Template_Leanpub
```

2) Uncomment lines 13-18 in this file:
```
# Only run after the render finishes running
#workflow_run:
#  workflows: [ "Build, Render, and Push" ]
#  branches: [ main ]
#  types:
#    - completed
```

### Style guide

Github actions will run the [`styler` package to all style R in all Rmds](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/blob/main/.github/workflows/style-and-sp-check.yml) whenever a pull request to the `main` branch is filed.
Style changes will automatically be committed back to your branch.

### Spell check

Github actions will automatically [run a spell check on all Rmds](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/blob/main/.github/workflows/style-and-sp-check.yml) whenever a pull request to the `main` branch is filed.
Depending on your preference, you may find it easier to [spell check manually on your local computer](#running-spell-check-and-styler-manually) before pushing to Github.

It will fail if there are more than 2 spelling errors and you'll need to resolve those before being able to merge your pull request.

To resolve those spelling errors, go to this repository's `Actions` tab.
Then, click on the GitHub action from the PR you just submitted.
Scroll all the way down to `Artifacts` and click `spell-check-results`.
This will download a zip file with a TSV that lists all the spelling errors.

Some of these errors may be things that the spell check doesn't recognize for example: `ITCR` or `DaSL`.
If it's a 'word' the spell check should recognize, you'll need to add this to the dictionary.

Go to the `https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/dictionary.txt` file.
Open the file and add the new 'word' to its appropriate place (the words are in alphabetical order).
Then commit the changes to `https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/dictionary.txt` to your branch and this should make the spell check status check pass.

### Google Slide Github Actions

There are two actions ran in `render-bookdown.yml` that attempt to keep Google Slides updated:
Note that the steps in [Google Slide related Secrets](#google-slide-related-secrets) need to be followed in order for these to properly run.

1) `google_slides_image_linker.R` makes sure any code output images are updated after bookdown is re-rendered.
2) `google_slide_png_downloader.R` downloads all the slides from the linked Google slide set as PNGs to `https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/gs_slides`.

Note that for the Google Slides actions to run you need to set up the [Google Slides Github actions in the `render-bookdown.yml` file](#for-a-course-that-will-need-changes-to-docker-image) and its [related secrets](#google-slide-related-secrets).

### Running spell check and styler manually

If you are using the [Docker container](#setting-up-docker-image), or otherwise have the `spelling` and `styler` package installed, you can run spell check and styling locally on all Rmds by running this:

```
Rscript scripts/spell-check.R
```

The spell check results file will be saved to a file called `spell_check_results.tsv`.
This file should not be pushed to the GitHub repository (it is in the gitignore so this shouldn't happen).

### URL Checking

[GitHub actions](#github-actions) runs a check on all the URLs upon creating a pull request to the `main` branch.
If it fails, you'll need to go the `Actions` tab of this repository, then find the GitHub `check_urls` job for the last commit you just pushed.
Click on `check_urls` and the specific step of `Check URLs` to see a print out of the URLs tested.

If the URL checker is failing on something that isn't really a URL or doesn't need to be checked, open up the GitHub actions file: `.github/workflows/url-checker.yml` and add the imposter URL on to the `exclude-urls:` argument with a comma in between.

### Adding logo

Logos for the table of contents are added with the  `_output.yml` file. This adds this an image above the table of contents when the content is rendered with `bookdown`.

If you are creating a general DaSL course:
 - Please replace the URL in the line 13 of code for the `_output.yml` file with the URL for the GitHub repo for your course. This will allow people to more easily find how out how you created your course. Otherwise, they will be directed to this template.

If you are creating a DaSL course for a project other than [ITN](https://www.itcrtraining.org/):
 - Delete the `_output.yml` file and rename the `_output-itcr.yml` to be `_output.yml`.  
 - Please modify the lines that link to the http://jhudatascience.org/ with your own website and logo if you are not part of the [jhuDaSL](http://jhudatascience.org/) .
- Please replace the URL in the line 13 of code with the URL for the GitHub repo for your course. This will allow people to more easily find how out how you created your course. Otherwise, they will be directed to this template.
- If you wish to create a different color scheme, the font colors can also be modified along with other aspects in the `assets/style.css` file. Take a look at the `assets/style_ITN.css` file to see what was changed for that color scheme from the `assets/style.css` file.
- You can replace the logo with the appropriate project logo by replacing `https://www.itcrtraining.org/` with the project website link and ` "https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/images/logo.png"` for the project logo image link in line 11.

If you are creating an ITCR course for [ITN](https://www.itcrtraining.org/):
- Delete the `_output.yml` file and rename the `_output-itcr.yml` to be `_output.yml`.
- Please modify the lines that link to the http://jhudatascience.org/ with your own website and logo if you are not part of the [jhuDaSL](http://jhudatascience.org/) .
- Please replace the URL in the line 13 of code with the URL for the GitHub repo for your course. This will allow people to more easily find how out how you created your course. Otherwise, they will be directed to this template.


## Setting Up Images and Graphics

To maintain style and attributions for graphics and images, as well as to enable easy updates in the future, please start a new Google Slide document for your course.
This also allows you to make videos of your slides that can be added to your course.

Each Rmd with images that is a part of your bookdown needs to have this chunk at the beginning so that images are stored properly for Leanpub conversion:

`````
```{r, include=FALSE}
leanbuild::set_knitr_image_path()
```
`````

Next, import the appropriate theme (see [this video](https://youtu.be/pNbwF263yY8) for assistance):

Note that you will need to [change your Google Slide permissions](https://support.google.com/drive/answer/2494893?hl=en&co=GENIE.Platform%3DDesktop) to "Anyone with a link" in order for some functionality to work.

#### Themes for non-ITCR projects:

 - If you are not creating a course as part of a larger collaboration but simply just as a DaSL course, import the theme from this [template](https://docs.google.com/presentation/d/1YmwKdIy9BeQ3EShgZhvtb3MgR8P6iDX4DfFD65W_gdQ/edit?usp=sharing). Once you have done this add a slide with the "Title slide" layout under layouts - and add your course title.

 ![](https://docs.google.com/presentation/d/1YmwKdIy9BeQ3EShgZhvtb3MgR8P6iDX4DfFD65W_gdQ/export/png?id=1YmwKdIy9BeQ3EShgZhvtb3MgR8P6iDX4DfFD65W_gdQ&pageid=p)


 - If you are working on a project (more likely) with the [Johns Hopkins Data Science Lab](http://jhudatascience.org/) than import the theme from this [template](https://docs.google.com/presentation/d/1qa3v_zlNedCKHQ6IYF5MM1ZLZLgHUs0U4usgDRRe3W8/edit?usp=sharing).

Add a title slide and update it with your project's logo.


![](https://docs.google.com/presentation/d/1qa3v_zlNedCKHQ6IYF5MM1ZLZLgHUs0U4usgDRRe3W8/export/png?id=1qa3v_zlNedCKHQ6IYF5MM1ZLZLgHUs0U4usgDRRe3W8&pageid=p)


In either case:

Be sure to add a terms of use slide to let people know about our licensing.

![](https://docs.google.com/presentation/d/1YmwKdIy9BeQ3EShgZhvtb3MgR8P6iDX4DfFD65W_gdQ/export/png?id=1YmwKdIy9BeQ3EShgZhvtb3MgR8P6iDX4DfFD65W_gdQ&pageid=gcc4fbee202_0_153)


For any major point, please select this layout:

![Major_point_layout](https://docs.google.com/presentation/d/1qa3v_zlNedCKHQ6IYF5MM1ZLZLgHUs0U4usgDRRe3W8/export/png?id=1qa3v_zlNedCKHQ6IYF5MM1ZLZLgHUs0U4usgDRRe3W8&pageid=gcf1264c749_0_130)

For itemized lists, please select this layout:

![list_layout](https://docs.google.com/presentation/d/1qa3v_zlNedCKHQ6IYF5MM1ZLZLgHUs0U4usgDRRe3W8/export/png?id=1qa3v_zlNedCKHQ6IYF5MM1ZLZLgHUs0U4usgDRRe3W8&pageid=gcf1264c749_0_135)

Please select the layout that looks like this for any images/content from outside sources:

![source_layout](https://docs.google.com/presentation/d/1qa3v_zlNedCKHQ6IYF5MM1ZLZLgHUs0U4usgDRRe3W8/export/png?id=1qa3v_zlNedCKHQ6IYF5MM1ZLZLgHUs0U4usgDRRe3W8&pageid=gcf1264c749_0_140)

Please update the text at the bottom to describe the source.

Once complete, your slides can be downloaded and a static version can be added to your bookdown and or Leanpub repository to build your course. See [this link](https://www.howtogeek.com/509046/how-to-save-google-slides-objects-as-images/) for information on how to download slides from Google Slides.

Images should be stored in `https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/images/` or you can link directly to your GoogleSlides following [the instructions here](https://www.evernote.com/shard/s425/client/snv?noteGuid=fd22f17a-5b1e-c3d6-eb85-e47c20aa4b1d&noteKey=58951432cb4f6f996ad9a28df6852248&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs425%2Fsh%2Ffd22f17a-5b1e-c3d6-eb85-e47c20aa4b1d%2F58951432cb4f6f996ad9a28df6852248&title=Google%2Bslides).  

Also add notes to each slide describing the text or images of the slide to allow for the content to be accessible to vision impaired individuals, as this can be converted to audio when creating videos.

#### Themes for ITCR project:

 - If you are not part of the [Johns Hopkins Data Science Lab](http://jhudatascience.org/), import the theme from this [template](https://docs.google.com/presentation/d/1lMNTlY8S21cNG4hL6NoOmXYZBQ30BtCQ4UdUJ7J_Wvs/edit?usp=sharing). Once you have done this add a slide with the ITN2 layout - and add your course title and any logos for your organization(s) that may be appropriate like so:

 ![](https://docs.google.com/presentation/d/1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU/export/png?id=1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU&pageid=p)

Also be sure to add a terms of use slide to let people know what licensing that you have chosen.
You can use ours (that looks like the slide below) if you like or create your own with a different license.

![](https://docs.google.com/presentation/d/1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU/export/png?id=1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU&pageid=gcf0c1d8548_0_157)


 - If you are part of the [Johns Hopkins Data Science Lab](http://jhudatascience.org/) than import the theme from this [template](https://docs.google.com/presentation/d/1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU/edit?usp=sharing).


Be sure to add a Johns Hopkins terms of use slide.

![Terms of Use](https://docs.google.com/presentation/d/1lMNTlY8S21cNG4hL6NoOmXYZBQ30BtCQ4UdUJ7J_Wvs/export/png?id=1lMNTlY8S21cNG4hL6NoOmXYZBQ30BtCQ4UdUJ7J_Wvs&pageid=gcc48deaeac_0_399)


For any major point, please select this layout:

![Major_point_layout](https://docs.google.com/presentation/d/1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU/export/png?id=1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU&pageid=gcf0c1d8548_0_136)

For itemized lists, please select this layout:

![list_layout](https://docs.google.com/presentation/d/1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU/export/png?id=1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU&pageid=gcf0c1d8548_0_141)

Please select the layout that looks like this for any images/content from outside sources:

![source_layout](https://docs.google.com/presentation/d/1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU/export/png?id=1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU&pageid=gcf0c1d8548_0_146)

Please update the text at the bottom to describe the source.

Once complete, your slides can be downloaded and a static version can be added to your bookdown and or Leanpub repository to build your course. See [this link](https://www.howtogeek.com/509046/how-to-save-google-slides-objects-as-images/) for information on how to download slides from Google Slides.

Images should be stored in `https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/images/` or you can link directly to your GoogleSlides following [the instructions here](https://www.evernote.com/shard/s425/client/snv?noteGuid=fd22f17a-5b1e-c3d6-eb85-e47c20aa4b1d&noteKey=58951432cb4f6f996ad9a28df6852248&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs425%2Fsh%2Ffd22f17a-5b1e-c3d6-eb85-e47c20aa4b1d%2F58951432cb4f6f996ad9a28df6852248&title=Google%2Bslides).  

Also add notes to each slide describing the text or images of the slide to allow for the content to be accessible to vision impaired individuals, as this can be converted to audio when creating videos.

### Accessibility

Each slide and image added to the courses needs to be accessible.
There are two things to check for each slide:

- [ ] Each slide is described in the notes of the slide so learners relying on a screen reader can access the content. See https://lastcallmedia.com/blog/accessible-comics for more guidance on this.

- [ ] The color palette choices of the slide are contrasted in a way that is friendly to those with color vision deficiencies.
You can check this using [Color Oracle](https://colororacle.org/).

## Adding images and graphics in text

All images should be included in your Google Slides with the captions we discussed above.
To add images in the text in your Rmd, use the following function within an [R code chunk](https://bookdown.org/yihui/rmarkdown/r-code.html).

`````
```{r, fig.alt="Alternative text", echo = FALSE, outwidth = "100%"}
leanbuild::include_slide(<google_slide_url>)
`````
_You must define `fig.alt` in the code chunk options/parameters to pass to `knitr`._
You can adjust the size(fig.hight, fig.width, out.width, out.height), alignment (fig.align), or caption (fig.cap) of the image you can use these arguments in the code chunk tag:  

`````
```{r, fig.alt="Alternative text", fig.height=4, fig.align='center', fig.cap='...'}

`````

It's also okay to use `<img src` for your images if you like you but you still need to make sure that you have alternative text designated using something like: `<img src="blah.png" alt="SOMETHING">`.

Google Slides must be **public**. Share settings must be set to "Anyone on the internet with this link can view". Note that "Private" is the default setting when you make a new presentation.

See [Chapter 2](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/blob/main/02-chapter_of_course.Rmd) of the template course for examples.

## Adding videos in text

To add a youtube video to your Rmd files use the following:

`````
```{r, fig.align="center", fig.alt = "video", echo=FALSE, out.width="100%"}
knitr::include_url("https://www.youtube.com/embed/yiZQaE0q9BY")
```
`````

To get the appropriate youtube url do the following:
1) click on the **SHARE** button on the lower right corner of the video on youtube
2) click on the **Embed** option on the far left
3) copy just the part after `"src ="` and paste the url into the `knitr::include_url()` function

Again, it is important to use the `echo=FALSE` option so that only the video is shown and not the code to generate it.

You could alternatively use html code by copying the entire embed code provded by youtube, but you might want to modify it a bit to center the video, like so:

`````
<p align="center"><iframe width="560" height="315" alt = "video of Russell McClain on biases and stereotypes" src="https://www.youtube.com/embed/yiZQaE0q9BY" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>
`````
See [Chapter 2](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/blob/main/02-chapter_of_course.Rmd) of the template course for examples.

## Adding embedded files to text

Sometimes it is useful to include an embedded version of a website or file on a website, if there is a particularly important link and you don't want to rely on learners clicking the link.

To include such a file or website do the following:

`````
```{r, fig.align="center", echo=FALSE}
knitr::include_url("https://www.messiah.edu/download/downloads/id/921/Microaggressions_in_the_Classroom.pdf", height = "800px")
```
`````

Again you will need to include `echo = FALSE` to ensure that the code to generate the preview of the website or file is not included in your course material.

If you want to include a file that is not hosted online, consider hosting it on GitHub using the method described for hosting your Bookdown version of the course. See the [Set up GitHub pages](#set-up-github-pages) section.

Then you would do the following, where the url is that of your hosted file:
`````
```{r, fig.align="center", echo=FALSE}
knitr::include_url("https://carriewright11.github.io/stringr_RLadies/index.html", height = "800px")
```
`````

You can also use html code for this like so:

`````
<p align="center"><iframe src="https://widgets.figshare.com/articles/5427418/embed?show_title=1" width="568" height="351" allowfullscreen frameborder="0" alt = "expectation document"></iframe></p>
`````

See [Chapter 2](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/blob/main/02-chapter_of_course.Rmd) of the template course for examples.

## Learning Objectives Formatting

Each chapter should start with Learning objectives!
You can use [this handout](https://www.bu.edu/cme/forms/RSS_forms/tips_for_writing_objectives.pdf) to help you craft learning objectives.

Learning objectives should be stated both in the slides and in the beginning of each bookdown chapter.
Because of this, you may find it most handy to use the [`List layout`](https://docs.google.com/presentation/d/1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU/export/png?id=1-7UvgVq5tP1pasTEErUM3bJFH2fU_pilH6i6_81CCXU&pageid=gcf0c1d8548_0_141) slide for stating your Learning objectives and then embed that in the book from your GoogleSlides [the instructions here](https://www.evernote.com/shard/s425/client/snv?noteGuid=fd22f17a-5b1e-c3d6-eb85-e47c20aa4b1d&noteKey=58951432cb4f6f996ad9a28df6852248&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs425%2Fsh%2Ffd22f17a-5b1e-c3d6-eb85-e47c20aa4b1d%2F58951432cb4f6f996ad9a28df6852248&title=Google%2Bslides).

## Bookdown Rendering

As you modify the names of the chapters of your course and add more chapters (using the `.Rmd` files), you need to update the `_bookdown.yml` file accordingly.

For example let's say that we added another chapter and named the file `03-chapter_of_course.Rmd`.
We would update our `_bookdown.yml` to look like this:

```yaml
book_filename: "Course_Name"  
chapter_name: "Chapter "  
repo: https://github.com/jhudsl/DaSL_Course_Template_Bookdown/ ##Make sure you update this for your GitHub Repo!!  
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

Note that when you run `bookdown` it will create an `.rds` file; you can generally ignore this file.

You will then see a live version of your book in your RStudio viewer.

Note that When a pull request is merged to main, `bookdown::render_book()` will be re-run by the [GitHub actions](#github-actions) and the results added to `main`.

# Publishing to Coursera

Once your content has been largely developed you may want to add your course to Coursera.

## Setting up your Coursera course

_If you are from Johns Hopkins:_
You will need to [follow this document](https://docs.google.com/document/d/1aZeOSFLkK4hZne4Vb1iaP_0H4zyhIwvbnw9sbdCFq1Y/edit?usp=sharing) and send information Ira Gooding who will create a course shell for you.

_If you are not from Johns Hopkins:_
You will need to set up your own educator profile and course shell through your institution.

## Converting your files for upload to Coursera

The Github actions set up in the [render-bookdown.yml](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/blob/main/.github/workflows/render-bookdown.yml) also render your course material in a format suitable for linking to Coursera.
This Coursera version is identical except that the table of contents bar on the left side has been dropped so as to not confuse Coursera users about navigating the course.
These files can be previewed in the `docs/coursera/` folder.
Click on  your chapter htmls to see what it will look like.

In the Leanpub repo, Leanpub-formatted quizzes can be converted to a Coursera yaml format. Or alternatively if you do not wish to have a Leanpub version of your course, you can either manually enter your Coursera quizzes or manually write a Coursera yaml file following the format of our [Coursera template quiz]().

## Navigating to your course on Coursera

After your [course shell has been added to your account](#setting-up-your-coursera-course) you can navigate to it by going to `My Courses`:

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/profile.png)

And you should see it listed:

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/my-courses.png)

You can click on `Go to Course`. And on your main course page click `Edit Course` in the right corner.

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/edit-course-nav.png)

This will bring you to your version page (at this point you should only have a Version 1, so go to that one).

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/versions.png)

Now you are on the Edit content page and ready to add lessons, modules and quizzes!

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/edit-content.png)

In general, you will want each lesson to contain at least a chapter and a quiz.

Each module is supposed to take a learner one week, so depending on the length of your chapters and quizzes you may want one or two lessons/chapters/quizzes a module.

To add a new lesson, click the `+ Add Lesson` button:

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-lesson.png)

Now you are ready to add a chapter!

### Adding new chapters to Coursera

You'll need to link out each chapters in Coursera by providing a url built from your Github pages.

You can see a preview of these chapters you will link to in Coursera by going to your [Github pages](https://guides.github.com/features/pages/), but adding `/coursera` at the end of your url before the chapter file name.

So the urls for each of your chapters which you will supply to Coursera in the next steps will look like this:
```
<main-github-pages-url>/coursera/<html_filename>
```
If you are unsure what the main url for your Github pages is, in your github repository, go to `Settings` > `Pages` and you'll see `Your site is published at:`

So for example, the introduction chapter of this template would be linked by using this url:

```
https://jhudatascience.org/DaSL_Course_Template_Bookdown/coursera/introduction.html
```

To add this URL to Coursera, add a new lesson, click `+ More` and choose `Ungraded Plugin`.

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-chapter-1.png)

This will add an unpublished ungraded plugin to your lesson:
![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-chapter-2.png)

Now click the edit button on the new `Ungraded Plugin`.

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-chapter-3.png)

This will bring you to the standard example plug in page.
![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-chapter-4.png)

Scroll down and click `Edit Configuration`:

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-chapter-5.png)

Replace the example url with the url of your individual chapter we discussed above.

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-chapter-6.png)

Then click on `Save Configuration`:

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-chapter-7.png)

IF the url you provided was correct, you should see a preview of your chapter:

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-chapter-8.png)

You may want to edit the title at the top of this page to indicate the material being linked.

Now click `Publish` in the left upper corner (don't worry it's not actually publishing publicly, its just saving your changes).
And it will ask you again to really scare you, but yes, click `Publish`.

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-chapter-9.png)

Congrats you added a chapter to your course! Now do the same thing for all your chapters!

### Adding new quizzes to Coursera

To add a new quiz start from your `Edit content` page and on whatever lesson you would like to add the quiz to and click the `+ Quiz` button.

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-quiz-1.png)

Now go to `Edit` on the new quiz.

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-quiz-2.png)

If you are choosing to manually enter your quizzes, you can continue to add each question from this page.

If you are importing a Leanpub converted quiz click the `Import Questions` button and choose your converted yml files.
(If you've not yet converted your leanpub quizzes, then [refer to that section](#converting-quizzes-from-leanpub-format).)

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-quiz-3.png)

Upload your Coursera quiz yml file from your device:

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-quiz-4.png)

After you've selected the file click `Upload`:

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-quiz-5.png)

It will let you know if there are any problems uploading the quiz. If the  `coursera_quiz_conversion.R` script failed to render something properly, please [file an issue here](https://github.com/jhudsl/DaSL_Course_Template_Leanpub/issues) describing how it failed and including a file that shows the instance it failed to convert.

Note that images and links are not currently supported in that conversion script. You also cannot have `:` in your prompts or answers.

But if the quiz uploads without issue, then click `Continue`.
You can edit the title of your quiz and then click `Publish` (don't worry it's not actually publishing publicly, its just saving your changes).
And it will ask you again to really scare you, but yes, click `Publish`.

![](https://raw.githubusercontent.com/jhudsl/DaSL_Course_Template_Bookdown/main/resources/coursera_screenshots/add-chapter-9.png)

Congrats you added a quiz to your course!
S
#### Converting quizzes from Leanpub format

If you already have a `_Leanpub` repository for your course, you can convert your quizzes to a nicely upload-able yaml file by using that repository and running this command with the leanbuild package:

```
leanbuild::convert_quizzes()
```

 Note that currently images and links are not supported and if your quizzes contain those, you will have to manually add them.

## Github actions for Coursera

The [render-bookdown.yml](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/blob/main/.github/workflows/render-bookdown.yml) github action the chapter content for Coursera by using this command within the docker image:
```
leanbuild::render_coursera()
```
You can run this same command locally if you wish to test something.
This render the chapters without the table of Contents.
If you do not wish to publish to Coursera and prefer this do not run, you may delete this section (but it shouldn't hurt anything to keep as is -- unless for some reason it causes you some troubles).

Additionally, the Leanpub companion repository has a [Leanpub -> Coursera quiz conversion script](https://github.com/jhudsl/DaSL_Course_Template_Leanpub/blob/main/scripts/coursera_quiz_conversion.R) if you choose to create quizzes and publish on both Leanpub and Coursera.
