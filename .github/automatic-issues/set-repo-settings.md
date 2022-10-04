
For more information on these settings see instructions in [Starting a new OTTR course](https://www.ottrproject.org/getting_started.html#starting-a-new-ottr-course).

- [ ] This course repository is set to `public`.
- [ ] [Add the `jhudsl-robot` as a collaborator to your repository.](https://www.ottrproject.org/getting_started.html#5_Add_jhudsl-robot_as_a_collaborator).

- [ ] [Github secret `GH_PAT` has been set](https://www.ottrproject.org/getting_started.html#6_Set_up_your_GitHub_personal_access_token)
  `Name`:  `GH_PAT`
  `value`: A personal access token [following these instructions](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-token).
  Underneath `Select scopes`, check both `repo` and `workflow`.
  Then copy the PAT and save as the value.
  
- [ ] GitHub pages is turned on
  - [ ] Go to `Settings` > `Pages`. Underneath `Source`, choose `main` for the branch and select the `docs` folder. Then click `Save`.  
  - [ ] Check `Enforce HTTPS`.

- [ ] [Set branch protections settings](https://github.com/jhudsl/OTTR_Template/wiki/Start-a-new-course#9-set-up-branch-rules)
  - [ ] `main` branch has been set up:
    - [ ] `Require pull request reviews before merging` box is checked.
    - [ ] `Require status checks to pass before merging` box is checked.
      - [ ] Underneath that `Require branches to be up to date before merging` box is checked.
  - [ ] Click `Save` at the bottom of the page!

- [ ] [Customize GitHub actions](https://github.com/jhudsl/OTTR_Template/wiki/How-to-set-up-and-customize-GitHub-actions-robots) for what you will need in this course.
