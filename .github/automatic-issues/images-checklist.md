
Use this checklist to make sure your slides and images are set up correctly!

See [Setting Up Images and Graphics](./getting_started.md#setting-up-images-and-graphics) for more info!

- [ ] The slides use the [appropriate template](./getting_started.md#setting-up-images-and-graphics).

- [ ] Each slide is described in the notes of the slide so learners relying on a screen reader can access the content. See https://lastcallmedia.com/blog/accessible-comics for more guidance on this.

- [ ] The color palette choices of the slide are contrasted in a way that is friendly to those with color vision deficiencies.
You can check this using [Color Oracle](https://colororacle.org/).

- [ ] Every image is [inserted into the text](./getting_started.md#s#adding-images-and-graphics-in-text) using one of these options: `leanbuild::include_slide()`, `knitr::include_image()`, or this format: `<img src="blah.png" alt="SOMETHING">`.

- [ ] Every image has [alternative text added to it](./getting_started.md#s#adding-images-and-graphics-in-text).

- [ ] The beginning of each Rmd contains this chunk so the images are saved in the correct spot:

`````
```{r, include=FALSE}
fp <- knitr::fig_path()
fp <- dirname(fp)
fp <- paste0("images/", fp, "/")
print(paste0("figpath is ", fp))
knitr::opts_chunk$set(fig.path = fp)
```
`````
