---
title: "Chapter of course"
output: html_document
---




## Learning Objectives

This chapter will cover:  

- {You can use https://www.bu.edu/cme/forms/RSS_forms/tips_for_writing_objectives.pdf to define some learning objectives here}
- {Another learning objective}

## Libraries

For this chapter, we'll need the following packages attached: 


```r
library(here)
```

```
## here() starts at /home/rstudio/ITCR_Course_Template_Bookdown
```

```r
library(ggplot2)
library(magrittr)
```

# Topic of Section

Text Text

## Subtopic

Text Text 

### Code examples


```r
output_dir <- "code_output"
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}
```


```r
iris %>%
  ggplot(aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  theme_bw()
```

<img src="02-chapter_of_course_files/figure-html/unnamed-chunk-4-1.png" width="672" />


```r
ggsave(file.path(output_dir, "test_ggplot2.png"))
```

```
## Saving 7 x 5 in image
```

### Image example

<img src="02-chapter_of_course_files/figure-html//1YmwKdIy9BeQ3EShgZhvtb3MgR8P6iDX4DfFD65W_gdQ_gcc4fbee202_0_141.png" title="Major point!! example image" alt="Major point!! example image" style="display: block; margin: auto;" />


### Video examples


<iframe src="https://www.youtube.com/embed/yiZQaE0q9BY" width="100%" height="400px"></iframe>

<iframe src="https://www.youtube.com/embed/VOCYL-FNbr0" width="100%" height="400px"></iframe>

### Embedded files examples


<iframe src="https://www.messiah.edu/download/downloads/id/921/Microaggressions_in_the_Classroom.pdf" width="672" height="800px"></iframe>

<iframe src="https://widgets.figshare.com/articles/5427418/embed?show_title=1" width="672" height="800px"></iframe>

Example of including a website:
<iframe src="https://yihui.org" width="672" height="800px"></iframe>

Example of including an html file hosted on GitHub:

<iframe src="https://carriewright11.github.io/stringr_RLadies/index.html" width="672" height="800px"></iframe>


### Citation examples

We can put citations at the end of a sentence like this [@bookdown2016]. 
Or multiple citations [@bookdown2016, @rmarkdown2018]. 

but they need a ; separator [@bookdown2016; @rmarkdown2018]. 

but they need a ; separator [ \[@bookdown2016\](#bookdown2016); \[@rmarkdown2018\](#rmarkdown2018)]. 

In text, we can put citations like this @bookdown2016. 


Here's a silly example which may mess up references.


```r
library(oro.nifti)
```

```
## oro.nifti 0.11.0
```

```r
img <- oro.nifti::nifti()
img@.Data
```

```
## , , 1, 1
## 
##      [,1]
## [1,]    0
```

## Print out session info


```r
devtools::session_info()
```

```
## Error in get(genname, envir = envir) : object 'testthat_print' not found
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
##  date     2021-08-20                  
## 
## ─ Packages ───────────────────────────────────────────────────────────────────
##  package     * version  date       lib source                                  
##  abind         1.4-5    2016-07-21 [1] RSPM (R 4.0.3)                          
##  ari           0.4.1    2021-05-11 [1] Github (muschellij2/ari@b1f3b64)        
##  ariExtra      0.3.0    2021-05-11 [1] Github (muschellij2/ariExtra@0049742)   
##  askpass       1.1      2019-01-13 [1] RSPM (R 4.0.3)                          
##  assertthat    0.2.1    2019-03-21 [1] RSPM (R 4.0.3)                          
##  bitops        1.0-6    2013-08-17 [1] RSPM (R 4.0.3)                          
##  blob          1.2.1    2020-01-20 [1] RSPM (R 4.0.3)                          
##  bookdown      0.22     2021-04-22 [1] CRAN (R 4.0.2)                          
##  cachem        1.0.4    2021-02-13 [1] CRAN (R 4.0.2)                          
##  callr         3.7.0    2021-04-20 [1] CRAN (R 4.0.2)                          
##  cli           2.5.0    2021-04-26 [1] CRAN (R 4.0.2)                          
##  colorspace    1.4-1    2019-03-18 [1] RSPM (R 4.0.0)                          
##  crayon        1.4.1    2021-02-08 [1] CRAN (R 4.0.2)                          
##  curl          4.3.1    2021-04-30 [1] CRAN (R 4.0.2)                          
##  DBI           1.1.0    2019-12-15 [1] RSPM (R 4.0.0)                          
##  desc          1.3.0    2021-03-05 [1] CRAN (R 4.0.2)                          
##  devtools      2.3.2    2020-09-18 [1] RSPM (R 4.0.3)                          
##  digest        0.6.27   2020-10-24 [1] CRAN (R 4.0.2)                          
##  docxtractr    0.6.5    2020-07-05 [1] CRAN (R 4.0.2)                          
##  dplyr         1.0.6    2021-05-05 [1] CRAN (R 4.0.2)                          
##  ellipsis      0.3.2    2021-04-29 [1] CRAN (R 4.0.2)                          
##  evaluate      0.14     2019-05-28 [1] RSPM (R 4.0.3)                          
##  fansi         0.4.2    2021-01-15 [1] CRAN (R 4.0.2)                          
##  farver        2.0.3    2020-01-16 [1] RSPM (R 4.0.3)                          
##  fastmap       1.1.0    2021-01-25 [1] CRAN (R 4.0.2)                          
##  fs            1.5.0    2020-07-31 [1] RSPM (R 4.0.3)                          
##  generics      0.1.0    2020-10-31 [1] CRAN (R 4.0.2)                          
##  ggplot2     * 3.3.2    2020-06-19 [1] RSPM (R 4.0.1)                          
##  glue          1.4.2    2020-08-27 [1] RSPM (R 4.0.3)                          
##  gtable        0.3.0    2019-03-25 [1] RSPM (R 4.0.3)                          
##  here        * 0.1      2017-05-28 [1] RSPM (R 4.0.0)                          
##  highr         0.9      2021-04-16 [1] CRAN (R 4.0.2)                          
##  hms           1.0.0    2021-01-13 [1] CRAN (R 4.0.2)                          
##  htmltools     0.5.1.1  2021-01-22 [1] CRAN (R 4.0.2)                          
##  httr          1.4.2    2020-07-20 [1] RSPM (R 4.0.3)                          
##  jsonlite      1.7.2    2020-12-09 [1] CRAN (R 4.0.2)                          
##  knitr         1.33     2021-04-24 [1] CRAN (R 4.0.2)                          
##  labeling      0.3      2014-08-23 [1] RSPM (R 4.0.0)                          
##  leanbuild     0.1.1    2021-05-11 [1] Github (jhudsl/leanbuild@139e892)       
##  lifecycle     1.0.0    2021-02-15 [1] CRAN (R 4.0.2)                          
##  magrittr    * 2.0.1    2020-11-17 [1] CRAN (R 4.0.2)                          
##  MASS          7.3-51.6 2020-04-26 [2] CRAN (R 4.0.2)                          
##  memoise       2.0.0    2021-01-26 [1] CRAN (R 4.0.2)                          
##  munsell       0.5.0    2018-06-12 [1] RSPM (R 4.0.3)                          
##  oro.nifti   * 0.11.0   2020-09-08 [1] RSPM (R 4.0.2)                          
##  pdftools      3.0.1    2021-05-06 [1] CRAN (R 4.0.2)                          
##  pillar        1.6.0    2021-04-13 [1] CRAN (R 4.0.2)                          
##  pkgbuild      1.1.0    2020-07-13 [1] RSPM (R 4.0.2)                          
##  pkgconfig     2.0.3    2019-09-22 [1] RSPM (R 4.0.3)                          
##  pkgload       1.1.0    2020-05-29 [1] RSPM (R 4.0.3)                          
##  prettyunits   1.1.1    2020-01-24 [1] RSPM (R 4.0.3)                          
##  processx      3.5.2    2021-04-30 [1] CRAN (R 4.0.2)                          
##  progress      1.2.2    2019-05-16 [1] RSPM (R 4.0.3)                          
##  ps            1.6.0    2021-02-28 [1] CRAN (R 4.0.2)                          
##  purrr         0.3.4    2020-04-17 [1] RSPM (R 4.0.3)                          
##  qpdf          1.1      2019-03-07 [1] RSPM (R 4.0.2)                          
##  R6            2.5.0    2020-10-28 [1] CRAN (R 4.0.2)                          
##  Rcpp          1.0.6    2021-01-15 [1] CRAN (R 4.0.2)                          
##  remotes       2.2.0    2020-07-21 [1] RSPM (R 4.0.3)                          
##  rlang         0.4.11   2021-04-30 [1] CRAN (R 4.0.2)                          
##  rmarkdown     2.8      2021-05-07 [1] CRAN (R 4.0.2)                          
##  RNifti        1.2.2    2020-09-07 [1] RSPM (R 4.0.2)                          
##  rprojroot     2.0.2    2020-11-15 [1] CRAN (R 4.0.2)                          
##  rvest         1.0.0    2021-03-09 [1] CRAN (R 4.0.2)                          
##  scales        1.1.1    2020-05-11 [1] RSPM (R 4.0.3)                          
##  sessioninfo   1.1.1    2018-11-05 [1] RSPM (R 4.0.3)                          
##  signal        0.7-6    2015-07-30 [1] CRAN (R 4.0.2)                          
##  stringi       1.6.1    2021-05-10 [1] CRAN (R 4.0.2)                          
##  stringr       1.4.0    2019-02-10 [1] RSPM (R 4.0.3)                          
##  testthat      2.3.2    2020-03-02 [1] RSPM (R 4.0.0)                          
##  text2speech   0.3.0    2021-05-11 [1] Github (muschellij2/text2speech@a0c9f86)
##  tibble        3.1.1    2021-04-18 [1] CRAN (R 4.0.2)                          
##  tidyselect    1.1.1    2021-04-30 [1] CRAN (R 4.0.2)                          
##  tuneR         1.3.3    2018-07-08 [1] CRAN (R 4.0.2)                          
##  usethis       2.0.1    2021-02-10 [1] CRAN (R 4.0.2)                          
##  utf8          1.2.1    2021-03-12 [1] CRAN (R 4.0.2)                          
##  vctrs         0.3.8    2021-04-29 [1] CRAN (R 4.0.2)                          
##  webshot       0.5.2    2019-11-22 [1] CRAN (R 4.0.2)                          
##  withr         2.4.2    2021-04-18 [1] CRAN (R 4.0.2)                          
##  xfun          0.22     2021-03-11 [1] CRAN (R 4.0.2)                          
##  xml2          1.3.2    2020-04-23 [1] RSPM (R 4.0.3)                          
##  yaml          2.2.1    2020-02-01 [1] RSPM (R 4.0.3)                          
## 
## [1] /usr/local/lib/R/site-library
## [2] /usr/local/lib/R/library
```
