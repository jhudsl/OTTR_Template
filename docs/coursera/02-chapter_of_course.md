---
title: "Chapter of course"
---


*If you haven't yet read the getting started guide; [start there](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/blob/main/getting_started.md)

Every chapter needs to start out with this chunk of code:



## Learning Objectives

*Every chapter also needs Learning objectives that will look like this:  

This chapter will cover:  

- {You can use https://www.bu.edu/cme/forms/RSS_forms/tips_for_writing_objectives.pdf to define some learning objectives here}
- {Another learning objective}

## Libraries

For this chapter, we'll need the following packages attached:

*Remember to add [any additional packages you need to your course's own docker image](https://github.com/jhudsl/DaSL_Course_Template_Bookdown/blob/main/getting_started.md#setting-up-the-docker-image).


```r
library(here)
```

```
## here() starts at /home/rstudio
```

```r
library(ggplot2)
library(magrittr)
```

# Topic of Section

You can write all your text in sections like this!

## Subtopic

Here's a subheading and some text in this subsection!

### Code examples

You can demonstrate code like this:


```r
output_dir <- file.path("resources", "code_output")
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}
```

And make pretty plots too:


```r
iris %>%
  ggplot(aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  theme_bw()
```

<img src="resources/images/02-chapter_of_course_files/figure-html/unnamed-chunk-4-1.png" width="672" />

You can also save these plots to file:


```r
ggsave(file.path(output_dir, "test_ggplot2.png"))
```

```
## Saving 7 x 5 in image
```

### Image example


How to include a Google slide. It's simplest to use the `leanbuild` package:

<img src="resources/images/02-chapter_of_course_files/figure-html//1YmwKdIy9BeQ3EShgZhvtb3MgR8P6iDX4DfFD65W_gdQ_gcc4fbee202_0_141.png" title="Major point!! example image" alt="Major point!! example image" style="display: block; margin: auto;" />

But if you have the slide or some other image locally downloaded you can also use html like this:

<img src="resources/images/02-chapter_of_course_files/figure-html//1YmwKdIy9BeQ3EShgZhvtb3MgR8P6iDX4DfFD65W_gdQ_gcc4fbee202_0_141.png" title="Major point!! example image" alt="Major point!! example image" style="display: block; margin: auto;" />


### Video examples

You can use `knitr::include_url()` like this:


```r
knitr::include_url("https://www.youtube.com/embed/VOCYL-FNbr0")
```

<iframe src="https://www.youtube.com/embed/VOCYL-FNbr0" width="672" height="400px"></iframe>

OR this works:

<iframe src="https://www.youtube.com/embed/VOCYL-FNbr0" width="672" height="400px"></iframe>

### Links to files

This works:

<iframe src="https://www.messiah.edu/download/downloads/id/921/Microaggressions_in_the_Classroom.pdf" width="672" height="800px"></iframe>

Or this:

[This works](https://www.messiah.edu/download/downloads/id/921/Microaggressions_in_the_Classroom.pdf).

Or this:

<iframe src="https://www.messiah.edu/download/downloads/id/921/Microaggressions_in_the_Classroom.pdf" width="672" height="800px"></iframe>

### Links to websites

Examples of including a website link.

This works:


```r
knitr::include_url("https://yihui.org")
```

<iframe src="https://yihui.org" width="672" height="400px"></iframe>

OR this:

![Another link](https://yihui.org)

OR this:

<iframe src="https://yihui.org" width="672" height="400px"></iframe>

### Citation examples

We can put citations at the end of a sentence like this [@bookdown2016].
Or multiple citations [@bookdown2016, @rmarkdown2018].

but they need a ; separator [@bookdown2016; @rmarkdown2018].

In text, we can put citations like this @bookdown2016.

## Print out session info


```r
devtools::session_info()
```

```
## ─ Session info ───────────────────────────────────────────────────────────────
##  setting  value                       
##  version  R version 4.0.2 (2020-06-22)
##  os       Ubuntu 20.04.2 LTS          
##  system   x86_64, linux-gnu           
##  ui       X11                         
##  language (EN)                        
##  collate  en_US.UTF-8                 
##  ctype    en_US.UTF-8                 
##  tz       Etc/UTC                     
##  date     2021-09-10                  
## 
## ─ Packages ───────────────────────────────────────────────────────────────────
##  package     * version    date       lib source                            
##  assertthat    0.2.1      2019-03-21 [1] RSPM (R 4.0.3)                    
##  backports     1.1.10     2020-09-15 [1] RSPM (R 4.0.2)                    
##  bookdown      0.20       2020-06-23 [1] RSPM (R 4.0.2)                    
##  callr         3.4.4      2020-09-07 [1] RSPM (R 4.0.2)                    
##  cli           2.0.2      2020-02-28 [1] RSPM (R 4.0.0)                    
##  colorspace    1.4-1      2019-03-18 [1] RSPM (R 4.0.0)                    
##  crayon        1.3.4      2017-09-16 [1] RSPM (R 4.0.0)                    
##  curl          4.3        2019-12-02 [1] RSPM (R 4.0.3)                    
##  desc          1.2.0      2018-05-01 [1] RSPM (R 4.0.3)                    
##  devtools      2.3.2      2020-09-18 [1] RSPM (R 4.0.3)                    
##  digest        0.6.25     2020-02-23 [1] RSPM (R 4.0.0)                    
##  dplyr         1.0.2      2020-08-18 [1] RSPM (R 4.0.2)                    
##  ellipsis      0.3.1      2020-05-15 [1] RSPM (R 4.0.3)                    
##  evaluate      0.14       2019-05-28 [1] RSPM (R 4.0.3)                    
##  fansi         0.4.1      2020-01-08 [1] RSPM (R 4.0.0)                    
##  farver        2.0.3      2020-01-16 [1] RSPM (R 4.0.3)                    
##  fs            1.5.0      2020-07-31 [1] RSPM (R 4.0.3)                    
##  generics      0.0.2      2018-11-29 [1] RSPM (R 4.0.0)                    
##  ggplot2     * 3.3.2      2020-06-19 [1] RSPM (R 4.0.1)                    
##  glue          1.4.2      2020-08-27 [1] RSPM (R 4.0.3)                    
##  gtable        0.3.0      2019-03-25 [1] RSPM (R 4.0.3)                    
##  here        * 0.1        2017-05-28 [1] RSPM (R 4.0.0)                    
##  highr         0.8        2019-03-20 [1] RSPM (R 4.0.3)                    
##  htmltools     0.5.0      2020-06-16 [1] RSPM (R 4.0.1)                    
##  httr          1.4.2      2020-07-20 [1] RSPM (R 4.0.3)                    
##  knitr         1.33       2021-09-08 [1] Github (yihui/knitr@a1052d1)      
##  labeling      0.3        2014-08-23 [1] RSPM (R 4.0.0)                    
##  leanbuild     0.1.2      2021-09-08 [1] Github (jhudsl/leanbuild@7404f63) 
##  lifecycle     1.0.0      2021-02-15 [1] CRAN (R 4.0.2)                    
##  magrittr    * 1.5        2014-11-22 [1] RSPM (R 4.0.0)                    
##  memoise       1.1.0      2017-04-21 [1] RSPM (R 4.0.0)                    
##  munsell       0.5.0      2018-06-12 [1] RSPM (R 4.0.3)                    
##  pillar        1.4.6      2020-07-10 [1] RSPM (R 4.0.2)                    
##  pkgbuild      1.1.0      2020-07-13 [1] RSPM (R 4.0.2)                    
##  pkgconfig     2.0.3      2019-09-22 [1] RSPM (R 4.0.3)                    
##  pkgload       1.1.0      2020-05-29 [1] RSPM (R 4.0.3)                    
##  prettyunits   1.1.1      2020-01-24 [1] RSPM (R 4.0.3)                    
##  processx      3.4.4      2020-09-03 [1] RSPM (R 4.0.2)                    
##  ps            1.3.4      2020-08-11 [1] RSPM (R 4.0.2)                    
##  purrr         0.3.4      2020-04-17 [1] RSPM (R 4.0.3)                    
##  R6            2.4.1      2019-11-12 [1] RSPM (R 4.0.0)                    
##  remotes       2.2.0      2020-07-21 [1] RSPM (R 4.0.3)                    
##  rlang         0.4.10     2021-09-08 [1] Github (r-lib/rlang@f0c9be5)      
##  rmarkdown     2.10       2021-09-08 [1] Github (rstudio/rmarkdown@02d3c25)
##  rprojroot     1.3-2      2018-01-03 [1] RSPM (R 4.0.0)                    
##  scales        1.1.1      2020-05-11 [1] RSPM (R 4.0.3)                    
##  sessioninfo   1.1.1      2018-11-05 [1] RSPM (R 4.0.3)                    
##  stringi       1.5.3      2020-09-09 [1] RSPM (R 4.0.3)                    
##  stringr       1.4.0      2019-02-10 [1] RSPM (R 4.0.3)                    
##  testthat      3.0.1      2021-09-08 [1] Github (R-lib/testthat@e99155a)   
##  tibble        3.0.3      2020-07-10 [1] RSPM (R 4.0.2)                    
##  tidyselect    1.1.0      2020-05-11 [1] RSPM (R 4.0.3)                    
##  usethis       2.0.1.9000 2021-09-08 [1] Github (r-lib/usethis@3385e14)    
##  vctrs         0.3.4      2020-08-29 [1] RSPM (R 4.0.2)                    
##  withr         2.3.0      2020-09-22 [1] RSPM (R 4.0.2)                    
##  xfun          0.21       2021-09-08 [1] Github (yihui/xfun@dd87cfc)       
##  yaml          2.2.1      2020-02-01 [1] RSPM (R 4.0.3)                    
## 
## [1] /usr/local/lib/R/site-library
## [2] /usr/local/lib/R/library
```
