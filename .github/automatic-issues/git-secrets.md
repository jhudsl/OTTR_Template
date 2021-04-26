
For more information on these settings see instructions in the [getting_started.md](./getting_started.md#adding-images-and-graphics).

It's important that these are set up and named exactly what they are below in order for Github actions to work correctly.

To set up these repository secrets, on your repository's main Github page, go to `Settings` and scroll down to see `Secrets` on the left side menu bar.

For each new secret, click the `New repository secret` button and set each as follows, clicking `Add secret` as you fill each in appropriately:  

- [ ] Set `DOCKERHUB_USERNAME`  
`Name`: `DOCKERHUB_USERNAME`
`value`: put your login username for https://hub.docker.com/

- [ ] Set `DOCKERHUB_PASSWORD`
`Name`: `DOCKERHUB_PASSWORD`  
`value`: put your login password for https://hub.docker.com/

- [ ] Set `GIT_TOKEN`
`Name`:  `GIT_TOKEN`
`value`: A personal access token [following these instructions](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token#creating-a-token).
Underneath `Select scopes`, check both `repo` and `workflow`.
Then copy the PAT and save as the value.

- [ ] Create your [course's main Google Slides](./getting_started#adding-images-and-graphics)

- [ ] `GOOGLE_SLIDE_ID`
`Name`: `GOOGLE_SLIDE_ID`  
`value`: The presentation ID of your main Google Slides for this course.
Set up the Google slides following the [instructions here](#adding-images-and-graphics).
The [<presentationID> is in the URL](https://developers.google.com/slides/how-tos/overview#the_structure_of_a_presentation) of your Google Slide:
```
https://docs.google.com/presentation/d/<presentationId>/edit
```
