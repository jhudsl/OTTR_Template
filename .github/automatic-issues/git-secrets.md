
For more information on these settings see instructions in the [getting_started.md](./getting_started.md#adding-images-and-graphics).

It's important that these are set up and named exactly what they are below in order for Github actions to work correctly.

To set up these repository secrets, on your repository's main Github page, go to `Settings` and scroll down to see `Secrets` on the left side menu bar.

For each new secret, click the `New repository secret` button and set each as follows, clicking `Add secret` as you fill each in appropriately:  

- [ ] Set `DOCKERHUB_USERNAME`  
`Name`: `DOCKERHUB_USERNAME`
`value`: put your login username for https://hub.docker.com/

- [ ] Set `DOCKERHUB_TOKEN`  
`Name`:`DOCKERHUB_TOKEN`
`value`: put a access token for Dockerhub which you can create this by following [these instructions](https://docs.docker.com/docker-hub/access-tokens/#create-an-access-token).

- [ ] Set `GIT_TOKEN`
`Name`:  `GIT_TOKEN`
`value`: A personal access token [following these instructions](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token#creating-a-token).
Underneath `Select scopes`, check both `repo` and `workflow`.
Then copy the PAT and save as the value.

- [ ] Create your [course's main Google Slides](./getting_started#adding-images-and-graphics)

#### Google Slide related Secrets

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

- [ ] Set `GOOGLE_SLIDE_ACCESS_TOKEN`
`Name`: `GOOGLE_SLIDE_ACCESS_TOKEN`
`value`: paste the output from `token$credentials$access_token` from the steps above.

- [ ] Set `GOOGLE_SLIDE_REFRESH_TOKEN`
`Name`: `GOOGLE_SLIDE_REFRESH_TOKEN`
`value`: paste the output from `token$credentials$access_token` from the steps above.

- [ ] Set `GOOGLE_SLIDE_ID`  
`Name`: `GOOGLE_SLIDE_ID` 
`value`: set the presentation ID of your main Google Slides for this course.
Set up the Google slides following the [instructions here](#adding-images-and-graphics).
The [<presentationID> is in the URL](https://developers.google.com/slides/how-tos/overview#the_structure_of_a_presentation) of your Google Slide:
```
https://docs.google.com/presentation/d/<presentationId>/edit
```

- [ ] (Optionally) Set the link to the [Leanpub repository](./getting_started/#linking-to-leanpub-repository)
