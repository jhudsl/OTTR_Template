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
## here() starts at /home/rstudio/DaSL_Course_Template_Bookdown
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
output_dir <- "code_output"
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
##  date     2021-09-07                  
## 
## ─ Packages ───────────────────────────────────────────────────────────────────
##  package     * version    date       lib
##  ari           0.4.1      2021-08-31 [1]
##  ariExtra      0.3.1      2021-08-31 [1]
##  askpass       1.1        2019-01-13 [1]
##  assertthat    0.2.1      2019-03-21 [1]
##  backports     1.1.10     2020-09-15 [1]
##  bookdown      0.20       2020-06-23 [1]
##  callr         3.4.4      2020-09-07 [1]
##  cli           2.0.2      2020-02-28 [1]
##  colorspace    1.4-1      2019-03-18 [1]
##  crayon        1.3.4      2017-09-16 [1]
##  curl          4.3        2019-12-02 [1]
##  desc          1.2.0      2018-05-01 [1]
##  devtools      2.3.2      2020-09-18 [1]
##  digest        0.6.25     2020-02-23 [1]
##  docxtractr    0.6.5      2020-07-05 [1]
##  dplyr         1.0.2      2020-08-18 [1]
##  ellipsis      0.3.1      2020-05-15 [1]
##  evaluate      0.14       2019-05-28 [1]
##  fansi         0.4.1      2020-01-08 [1]
##  farver        2.0.3      2020-01-16 [1]
##  fs            1.5.0      2020-07-31 [1]
##  generics      0.0.2      2018-11-29 [1]
##  ggplot2     * 3.3.2      2020-06-19 [1]
##  glue          1.4.2      2020-08-27 [1]
##  gtable        0.3.0      2019-03-25 [1]
##  here        * 0.1        2017-05-28 [1]
##  highr         0.8        2019-03-20 [1]
##  hms           0.5.3      2020-01-08 [1]
##  htmltools     0.5.0      2020-06-16 [1]
##  httr          1.4.2      2020-07-20 [1]
##  jsonlite      1.7.1      2020-09-07 [1]
##  knitr         1.33       2021-08-31 [1]
##  labeling      0.3        2014-08-23 [1]
##  leanbuild     0.1.2      2021-08-31 [1]
##  lifecycle     1.0.0      2021-02-15 [1]
##  magrittr    * 1.5        2014-11-22 [1]
##  MASS          7.3-51.6   2020-04-26 [2]
##  memoise       1.1.0      2017-04-21 [1]
##  munsell       0.5.0      2018-06-12 [1]
##  pdftools      2.3.1      2020-05-22 [1]
##  pillar        1.4.6      2020-07-10 [1]
##  pkgbuild      1.1.0      2020-07-13 [1]
##  pkgconfig     2.0.3      2019-09-22 [1]
##  pkgload       1.1.0      2020-05-29 [1]
##  prettyunits   1.1.1      2020-01-24 [1]
##  processx      3.4.4      2020-09-03 [1]
##  progress      1.2.2      2019-05-16 [1]
##  ps            1.3.4      2020-08-11 [1]
##  purrr         0.3.4      2020-04-17 [1]
##  qpdf          1.1        2019-03-07 [1]
##  R6            2.4.1      2019-11-12 [1]
##  Rcpp          1.0.5      2020-07-06 [1]
##  remotes       2.2.0      2020-07-21 [1]
##  rlang         0.4.10     2021-08-31 [1]
##  rmarkdown     2.10       2021-08-31 [1]
##  rprojroot     1.3-2      2018-01-03 [1]
##  rvest         1.0.1      2021-08-31 [1]
##  scales        1.1.1      2020-05-11 [1]
##  sessioninfo   1.1.1      2018-11-05 [1]
##  signal        0.7-6      2015-07-30 [1]
##  stringi       1.5.3      2020-09-09 [1]
##  stringr       1.4.0      2019-02-10 [1]
##  testthat      3.0.1      2021-08-31 [1]
##  text2speech   0.3.0      2021-08-31 [1]
##  tibble        3.0.3      2020-07-10 [1]
##  tidyselect    1.1.0      2020-05-11 [1]
##  tuneR         1.3.3      2018-07-08 [1]
##  usethis       2.0.1.9000 2021-08-31 [1]
##  vctrs         0.3.4      2020-08-29 [1]
##  webshot       0.5.2      2019-11-22 [1]
##  withr         2.3.0      2020-09-22 [1]
##  xfun          0.21       2021-08-31 [1]
##  xml2          1.3.2      2020-04-23 [1]
##  yaml          2.2.1      2020-02-01 [1]
##  source                                  
##  Github (jhudsl/ari@2638775)             
##  Github (jhudsl/ariExtra@86c733b)        
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.2)                          
##  RSPM (R 4.0.2)                          
##  RSPM (R 4.0.2)                          
##  RSPM (R 4.0.0)                          
##  RSPM (R 4.0.0)                          
##  RSPM (R 4.0.0)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.0)                          
##  RSPM (R 4.0.2)                          
##  RSPM (R 4.0.2)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.0)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.0)                          
##  RSPM (R 4.0.1)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.0)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.0)                          
##  RSPM (R 4.0.1)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.2)                          
##  Github (yihui/knitr@a1052d1)            
##  RSPM (R 4.0.0)                          
##  Github (jhudsl/leanbuild@769c2aa)       
##  CRAN (R 4.0.2)                          
##  RSPM (R 4.0.0)                          
##  CRAN (R 4.0.2)                          
##  RSPM (R 4.0.0)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.2)                          
##  RSPM (R 4.0.2)                          
##  RSPM (R 4.0.2)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.2)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.2)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.2)                          
##  RSPM (R 4.0.0)                          
##  RSPM (R 4.0.2)                          
##  RSPM (R 4.0.3)                          
##  Github (r-lib/rlang@f0c9be5)            
##  Github (rstudio/rmarkdown@02d3c25)      
##  RSPM (R 4.0.0)                          
##  Github (tidyverse/rvest@4fe39fb)        
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.0)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.3)                          
##  Github (R-lib/testthat@e99155a)         
##  Github (muschellij2/text2speech@a0c9f86)
##  RSPM (R 4.0.2)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.0)                          
##  Github (r-lib/usethis@3385e14)          
##  RSPM (R 4.0.2)                          
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.2)                          
##  Github (yihui/xfun@dd87cfc)             
##  RSPM (R 4.0.3)                          
##  RSPM (R 4.0.3)                          
## 
## [1] /usr/local/lib/R/site-library
## [2] /usr/local/lib/R/library
```
