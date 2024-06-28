# Want to contribute to OTTR?

## Code of Conduct

The [Contributor Covenant Code of Conduct can be found here](https://github.com/jhudsl/OTTR_Template/blob/main/code_of_conduct.md)

## What are the different OTTR repositories/resources?

Open-source Tools for Training Resources (OTTR) are a set of GitHub repositories designed to offer efficiency and flexibility in creating and maintaining training resources for courses and informatics tools. Below different repositories and resources that part of the OTTR universe are listed with brief explanations of what they do. The repositories and resources are split between "Functionality" and "Documentation" where the "Functionality" section focuses on the repositories or code that make OTTR functional; and the "Documentation" section focuses on the resources that explain how to use and maintain OTTR.

### Functionality
#### OTTR_Template

The [OTTR_Template repository](https://github.com/jhudsl/OTTR_Template) is a template used to create OTTR courses, specifically when you're writing one course, but publishing it in three places: (bookdown/website), Leanpub, and Coursera. If used with [a pull request model](https://www.ottrproject.org/writing_content_courses.html#about-ottr-and-pull-requests), courses built with the template will be checked for spelling errors and periodically for broken URLs, and can be previewed and automatically rendered after updates.

#### OTTR_Quizzes

The [OTTR_Quizzes repository](https://github.com/jhudsl/OTTR_Quizzes) can be used when you want your course quizzes to remain private rather being housed in a public, open source repository. Use of this repository is in conjunction with the main OTTR_Template. All edits and additions to non-quiz content should take place

#### OTTR_Template_Website

The [OTTR_Template_Website repository](https://github.com/jhudsl/OTTR_Template_Website) is a template used to create OTTR websites. Like the main OTTR_Template, if used with [a pull request model](https://www.ottrproject.org/writing_content_courses.html#about-ottr-and-pull-requests), websites built with the template will be checked for spelling errors and periodically for broken URLs, and can be previewed and automatically rendered after updates. Unlike the main OTTR_Template, it only produces a website as output.

#### ottr-reports

The [ottr-reports repository](https://github.com/jhudsl/ottr-reports) houses the functionality for reporting the results of the GitHub Action checks on spelling, URLs, and quiz formatting.

#### ottr-docker

The [ottr_docker repository](https://github.com/jhudsl/ottr_docker) holds the Dockerfiles for docker images available for use with OTTR.

#### ottrpal

The [ottrpal repository](https://github.com/jhudsl/ottrpal) provides the functionality to convert an OTTR course to files ready for use in Leanpub and Coursera

#### cow

The [cow repository](https://github.com/jhudsl/cow) isn't officially an OTTR repository, but is a GitHub API wrapper in R which has additional functions to help wrangle GitHub published courses like OTTR courses.

### Documentation

#### ottrproject.org

The [ottrproject.org repository](https://github.com/jhudsl/ottrproject.org) renders the [OTTR documentation website](https://www.ottrproject.org/). The repository is generated from the [OTTR_Template_Website template](https://github.com/jhudsl/OTTR_Template_Website).

#### OTTR paper

There's an [OTTR paper](https://pubmed.ncbi.nlm.nih.gov/37207236/) published in the Journal of Statistics and Data Science Education by C. Savonen, C. Wright, A. Hoffman, et al. in 2023. [For information on citing the manuscript, see here](https://www.ottrproject.org/index.html#how-to-cite-ottr)

#### Cheatsheets

TBA

#### Videos

TBA

## How should you suggest changes or alert us about problems?

There are various ways in which you can request or suggest changes to OTTR. Below we discuss ways in which you can make suggestions or requests, but leave the implementation to others or implement the suggestions yourselves.

### You want to make suggestions, but leave the implementation to someone else

If you want to alert us about an issue or make suggestions, you can open a GitHub Issue or submit a response in our [OTTR Feedback Google Form](https://forms.gle/jGQnd5oemHWyuUq28).

If you aren't sure what repository the suggestion pertains to -- or if the suggestion pertains to multiple repositories file it to the [`OTTR_Template` repo](https://github.com/jhudsl/OTTR_Template/issues/new/choose).

#### GitHub Issues

Open an issue describing the bug or feature request for the relevant repository using the following links.

| Repository            | Issues Link                                                                 |
|:---------------------:|:---------------------------------------------------------------------------:|
| OTTR_Template         | [Open an issue here](https://github.com/jhudsl/OTTR_Template/issues/new/choose)        |
| OTTR_Quizzes          | [Open an issue here](https://github.com/jhudsl/OTTR_Quizzes/issues/new/choose)         |
| OTTR_Template_Website | [Open an issue here](https://github.com/jhudsl/OTTR_Template_Website/issues/new/choose)|
| ottr-reports          | [Open an issue here](https://github.com/jhudsl/ottr-reports/issues/new/choose)         |
| ottr-docker           | [Open an issue here](https://github.com/jhudsl/ottr_docker/issues/new/choose)          |
| ottrpal               | [Open an issue here](https://github.com/jhudsl/ottrpal/issues/new/choose)              |
| cow                   | [Open an issue here](https://github.com/jhudsl/cow/issues/new/choose)                  |
| ottrproject.org       | [Open an issue here](https://github.com/jhudsl/ottrpal/issues/new/choose)              |

##### Description of choices for issue type (if given)

Most of the links above will directly open an issue for you to fill out a description of the problem or request, but several of the repositories provide choices (and related description templates) for the type of issue you want to open. Those choices could include the following:  

* **Feature Request** or **Course Template Feature Request**: Use this issue if you want to make a suggestion for an addition.
* **Problem Report** or **Course Template Problem Report**: Use this issue if you want to report a problem or possible improvement.
* **New Content Idea**: This is a template meant for opening an issue in an OTTR course, so that someone can suggest an additional topic or idea for that specific course. It can be used for general suggestions for content.
* **Course Problem Report**: This is a template meant for opening an issue in an OTTR course, so that someone can point out a problem or suggest an improvement for that specific course. It shouldn't be used for opening an issue in one of these repos.

##### Assign an OTTR maintainer

Assign an OTTR maintainer (`@cansavvy` or `@carriewright11` or `@avahoffman`) to the issue. If you aren't sure who the issue pertains to, assign `@cansavvy` and she'll make sure it gets to the right person.

#### Google Form

This [OTTR Feedback Google Form](https://docs.google.com/forms/d/e/1FAIpQLSfcc_h1MPfCOWyQup4Z76lzlBGz8cAkDQmBiqfxqOZ4_4lCkQ/viewform) can be used to ask questions about any problems you encounter or submit feedback such as ideas or requests for improvements.

### You want to make suggestions, and implement them yourself!

If you want to implement an improvement or fix a problem, open a branch, make the changes to the code there, and then open a pull request. [See this chapter "Using Version Control with GitHub"](https://jhudatascience.org/Adv_Reproducibility_in_Cancer_Informatics/using-version-control-with-github.html) from our Advanced Reproducibility course for more information on this pull request model if needed.  

#### Request Review

Make sure to request review of your pull request from an OTTR maintainer (`@cansavvy` or `@carriewright11` or `@avahoffman`).

## What if you want to make several courses with similar branding using OTTR?

If you plan to use the OTTR template several times for related courses within an organization and want each to have a shared branding or functionality variation, you may want to make your own template from the OTTR_Template, incorporating the stylistic changes in your spinoff template before making specific courses from the spinoff template.

OTTR_Template --> Spinoff_Template (Make stylistic changes, mark as a template repository) --> Course Repository

Examples that have done this include:

| Spinoff template   | Link |
|:------------------:|:-------------------------------------------------------------------------:|
| AnVIL Template     | [GitHub Source Code](https://github.com/jhudsl/AnVIL_Template)            |
| DataTrail Template | [GitHub Source Code](https://github.com/datatrail-jhu/DataTrail_Template) |
|Quarto website| [GitHub Source Code](https://github.com/fhdsl/OTTR_Quarto)|
|Metric collection dashboard template| [GitHub Source Code](https://github.com/fhdsl/metricminer-dashboard)|

If you are interested in this and have questions, reach out to the OTTR maintainers by filing a GitHub issue and assigning `@cansavvy`, `@carriewright11`, and `@avahoffman`.
