
**Note these steps are only pertinent if you are setting up this course outside of the jhudsl organization**

For more information on these settings see instructions in the [getting started GitHub wiki pages](https://github.com/jhudsl/OTTR_Template/wiki/Setting-up-GitHub-secrets).

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

- [ ] (Optionally) Set up your [`Leanpub` repository link to it](https://github.com/jhudsl/OTTR_Template/wiki/Publishing-on-Leanpub)
