
[Follow the Wiki instructions here](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/wiki/Setting-up-your-repository-files#setting-up-the-repository) for details on how to complete the items in this issue.

The following files need to be edited to get this new course started!

_If you are creating an ITCR course:_

- [ ] Delete `_output.yml` and `index.Rmd` files
- [ ] Keep the `_output-itcr.yml` and `index-itcr.Rmd` files but delete the `-itcr` parts of those file names.

_If you are creating any other courses:_

- [ ] Delete the `_output-itcr.yml` and `index-itcr.Rmd` files.

### Files that need edited upon creating a new course.

- [ ] `README.md` - Fill in all the `{ }`.
- [ ] `index.Rmd` - the `author:`, `title:`, and `description:` should be updated.
- [ ] `About.Rmd` - Replace information with your own author information and change the course title in the yaml header!
- [ ] `01-intro.Rmd` - replace the information there with information pertinent to this new course.
- [ ] `02-chapter_of_course.Rmd` - This Rmd has examples of how to set things up, if you don't need it as a reference, it can be deleted.
- [ ] `code_output` can be deleted if you don't plan to use code.

### Files that need to be edited upon adding each new chapter (including upon creating a new course):

- [ ] `_bookdown.yml` - The list of Rmd files that need to be rendered needs to be updated. See [instructions](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/wiki/Publishing-with-Bookdown).
- [ ] `book.bib` - any citations need to be added. See [instructions](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/wiki/Citations).

### Files that need to be edited upon adding new packages that the book's code uses:
- `docker/Dockerfile` needs to have the new package added so it will be installed. See [instructions](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/wiki/Using-Docker#starting-a-new-docker-image).
- The code chunk in `index.Rmd` should be edited to add the new package.
