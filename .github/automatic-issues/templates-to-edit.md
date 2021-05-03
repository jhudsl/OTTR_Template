
The following files need to be edited to get this new course started!


_If you are creating an ITCR course:_

- [ ] Delete `_output.yml` and `index.Rmd` files
- [ ] Keep the `_output-itcr.yml` and `index-itcr.Rmd` files but delete the `-itcr` parts of those file names.

_If you are creating any other courses:_

- [ ] Delete the `_output-itcr.yml` and `index-itcr.Rmd` files.

### Files that need edited upon creating a new course.

- [ ] `README.md` - Fill in all the `{ }`.
- [ ] `index.Rmd` - the `author:`, `title:`, and `description:` should be updated.
- [ ] `About.Rmd` - Replace information with your own author information.
- [ ] `01-intro.Rmd` - replace the information there with information pertinent to this new course.
- [ ] `02-chapter_of_course.Rmd` - This Rmd has examples of how to set things up, if you don't need it as a reference, it be deleted.
- [ ] `code_output` can be deleted.

### Files that need to be edited upon adding each new chapter (including upon creating a new course):

- [ ] `_bookdown.yml` - The Rmd files that need to be rendered need to be updated. See [instructions](./getting_started.md#bookdown-rendering).
- [ ] `book.bib` - any citations need to be added. See [instructions](./getting_started.md#citations).

### Files that need to be edited upon adding new packages that the book's code uses:
- `docker/Dockerfile` needs to have the new package added so it will be installed. See [instructions](./getting_started.md#adding-packages-to-the-dockerfile).
- The code chunk in `index.Rmd` should be edited to add the new package.
