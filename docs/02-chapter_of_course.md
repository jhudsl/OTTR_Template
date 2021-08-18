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
## here() starts at /Users/carriewright/Documents/GitHub/ITCR/templates/DaSL_Course_Template_Bookdown
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

<img src="images/02-chapter_of_course_files/figure-html/unnamed-chunk-4-1.png" width="672" />


```r
ggsave(file.path(output_dir, "test_ggplot2.png"))
```

```
## Saving 7 x 5 in image
```

### Image example

<img src="images/02-chapter_of_course_files/figure-html//1YmwKdIy9BeQ3EShgZhvtb3MgR8P6iDX4DfFD65W_gdQ_gcc4fbee202_0_141.png" title="Major point!! example image" alt="Major point!! example image" width="480" style="display: block; margin: auto;" />


### Video examples


<iframe src="https://www.youtube.com/embed/yiZQaE0q9BY" width="100%" height="400px" data-external="1"></iframe>

<iframe src="https://www.youtube.com/embed/VOCYL-FNbr0" width="100%" height="400px" data-external="1"></iframe>

### Embedded files examples


<iframe src="https://www.messiah.edu/download/downloads/id/921/Microaggressions_in_the_Classroom.pdf" width="672" height="800px" data-external="1"></iframe>

<iframe src="https://widgets.figshare.com/articles/5427418/embed?show_title=1" width="672" height="800px" data-external="1"></iframe>

Example of including a website:
<iframe src="https://yihui.org" width="672" height="800px" data-external="1"></iframe>

Example of including an html file hosted on GitHub:

<iframe src="https://carriewright11.github.io/stringr_RLadies/index.html" width="672" height="800px" data-external="1"></iframe>


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
## ─ Session info ───────────────────────────────────────────────────────────────
##  setting  value                       
##  version  R version 4.0.3 (2020-10-10)
##  os       macOS Mojave 10.14.6        
##  system   x86_64, darwin17.0          
##  ui       X11                         
##  language (EN)                        
##  collate  en_US.UTF-8                 
##  ctype    en_US.UTF-8                 
##  tz       America/New_York            
##  date     2021-08-17                  
## 
## ─ Packages ───────────────────────────────────────────────────────────────────
##  package     * version date       lib source                                  
##  abind         1.4-5   2016-07-21 [1] CRAN (R 4.0.0)                          
##  ari           0.4.1   2021-05-06 [1] Github (muschellij2/ari@b1f3b64)        
##  ariExtra      0.3.1   2021-06-23 [1] Github (jhudsl/ariExtra@86c733b)        
##  askpass       1.1     2019-01-13 [1] CRAN (R 4.0.0)                          
##  assertthat    0.2.1   2019-03-21 [1] CRAN (R 4.0.0)                          
##  bitops        1.0-7   2021-04-24 [1] CRAN (R 4.0.2)                          
##  bookdown      0.22    2021-04-22 [1] CRAN (R 4.0.2)                          
##  bslib         0.2.5.1 2021-05-18 [1] CRAN (R 4.0.2)                          
##  cachem        1.0.5   2021-05-15 [1] CRAN (R 4.0.2)                          
##  callr         3.7.0   2021-04-20 [1] CRAN (R 4.0.2)                          
##  cli           3.0.1   2021-07-17 [1] CRAN (R 4.0.2)                          
##  colorspace    2.0-2   2021-06-24 [1] CRAN (R 4.0.2)                          
##  crayon        1.4.1   2021-02-08 [1] CRAN (R 4.0.3)                          
##  curl          4.3.2   2021-06-23 [1] CRAN (R 4.0.2)                          
##  DBI           1.1.1   2021-01-15 [1] CRAN (R 4.0.2)                          
##  desc          1.3.0   2021-03-05 [1] CRAN (R 4.0.2)                          
##  devtools      2.4.2   2021-06-07 [1] CRAN (R 4.0.2)                          
##  digest        0.6.27  2020-10-24 [1] CRAN (R 4.0.2)                          
##  docxtractr    0.6.5   2020-07-05 [1] CRAN (R 4.0.2)                          
##  dplyr         1.0.7   2021-06-18 [1] CRAN (R 4.0.2)                          
##  ellipsis      0.3.2   2021-04-29 [1] CRAN (R 4.0.2)                          
##  evaluate      0.14    2019-05-28 [1] CRAN (R 4.0.0)                          
##  fansi         0.5.0   2021-05-25 [1] CRAN (R 4.0.2)                          
##  farver        2.1.0   2021-02-28 [1] CRAN (R 4.0.2)                          
##  fastmap       1.1.0   2021-01-25 [1] CRAN (R 4.0.2)                          
##  fs            1.5.0   2020-07-31 [1] CRAN (R 4.0.2)                          
##  generics      0.1.0   2020-10-31 [1] CRAN (R 4.0.2)                          
##  ggplot2     * 3.3.5   2021-06-25 [1] CRAN (R 4.0.2)                          
##  glue          1.4.2   2020-08-27 [1] CRAN (R 4.0.2)                          
##  gtable        0.3.0   2019-03-25 [1] CRAN (R 4.0.0)                          
##  here        * 1.0.1   2020-12-13 [1] CRAN (R 4.0.2)                          
##  highr         0.9     2021-04-16 [1] CRAN (R 4.0.2)                          
##  hms           1.1.0   2021-05-17 [1] CRAN (R 4.0.2)                          
##  htmltools     0.5.1.1 2021-01-22 [1] CRAN (R 4.0.2)                          
##  httr          1.4.2   2020-07-20 [1] CRAN (R 4.0.2)                          
##  jquerylib     0.1.4   2021-04-26 [1] CRAN (R 4.0.2)                          
##  jsonlite      1.7.2   2020-12-09 [1] CRAN (R 4.0.2)                          
##  knitr         1.33.8  2021-07-23 [1] Github (yihui/knitr@d65b923)            
##  labeling      0.4.2   2020-10-20 [1] CRAN (R 4.0.2)                          
##  leanbuild     0.1.2   2021-06-23 [1] Github (jhudsl/leanbuild@f9be3fd)       
##  lifecycle     1.0.0   2021-02-15 [1] CRAN (R 4.0.2)                          
##  magrittr    * 2.0.1   2020-11-17 [1] CRAN (R 4.0.2)                          
##  MASS          7.3-54  2021-05-03 [1] CRAN (R 4.0.2)                          
##  memoise       2.0.0   2021-01-26 [1] CRAN (R 4.0.2)                          
##  munsell       0.5.0   2018-06-12 [1] CRAN (R 4.0.0)                          
##  oro.nifti   * 0.11.0  2020-09-08 [1] CRAN (R 4.0.2)                          
##  pdftools      3.0.1   2021-05-06 [1] CRAN (R 4.0.2)                          
##  pillar        1.6.2   2021-07-29 [1] CRAN (R 4.0.2)                          
##  pkgbuild      1.2.0   2020-12-15 [1] CRAN (R 4.0.2)                          
##  pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 4.0.0)                          
##  pkgload       1.2.1   2021-04-06 [1] CRAN (R 4.0.2)                          
##  png           0.1-7   2013-12-03 [1] CRAN (R 4.0.2)                          
##  prettyunits   1.1.1   2020-01-24 [1] CRAN (R 4.0.0)                          
##  processx      3.5.2   2021-04-30 [1] CRAN (R 4.0.2)                          
##  progress      1.2.2   2019-05-16 [1] CRAN (R 4.0.0)                          
##  ps            1.6.0   2021-02-28 [1] CRAN (R 4.0.2)                          
##  purrr         0.3.4   2020-04-17 [1] CRAN (R 4.0.0)                          
##  qpdf          1.1     2019-03-07 [1] CRAN (R 4.0.0)                          
##  R6            2.5.0   2020-10-28 [1] CRAN (R 4.0.2)                          
##  ragg          1.1.3   2021-06-09 [1] CRAN (R 4.0.2)                          
##  Rcpp          1.0.7   2021-07-07 [1] CRAN (R 4.0.2)                          
##  remotes       2.4.0   2021-06-02 [1] CRAN (R 4.0.2)                          
##  rlang         0.4.11  2021-04-30 [1] CRAN (R 4.0.2)                          
##  rmarkdown     2.9.5   2021-07-23 [1] Github (rstudio/rmarkdown@0af6b35)      
##  RNifti        1.3.1   2021-05-13 [1] CRAN (R 4.0.2)                          
##  rprojroot     2.0.2   2020-11-15 [1] CRAN (R 4.0.2)                          
##  rstudioapi    0.13    2020-11-12 [1] CRAN (R 4.0.2)                          
##  rvest         1.0.0   2021-03-09 [1] CRAN (R 4.0.2)                          
##  sass          0.4.0   2021-05-12 [1] CRAN (R 4.0.2)                          
##  scales        1.1.1   2020-05-11 [1] CRAN (R 4.0.0)                          
##  sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 4.0.2)                          
##  signal        0.7-7   2021-05-25 [1] CRAN (R 4.0.2)                          
##  stringi       1.7.3   2021-07-16 [1] CRAN (R 4.0.2)                          
##  stringr       1.4.0   2019-02-10 [1] CRAN (R 4.0.0)                          
##  systemfonts   1.0.2   2021-05-11 [1] CRAN (R 4.0.2)                          
##  testthat      3.0.4   2021-07-01 [1] CRAN (R 4.0.2)                          
##  text2speech   0.3.0   2021-03-03 [1] Github (muschellij2/text2speech@a0c9f86)
##  textshaping   0.3.5   2021-06-09 [1] CRAN (R 4.0.2)                          
##  tibble        3.1.3   2021-07-23 [1] CRAN (R 4.0.2)                          
##  tidyselect    1.1.1   2021-04-30 [1] CRAN (R 4.0.2)                          
##  tuneR         1.3.3   2018-07-08 [1] CRAN (R 4.0.2)                          
##  usethis       2.0.1   2021-02-10 [1] CRAN (R 4.0.2)                          
##  utf8          1.2.2   2021-07-24 [1] CRAN (R 4.0.2)                          
##  vctrs         0.3.8   2021-04-29 [1] CRAN (R 4.0.2)                          
##  webshot       0.5.2   2019-11-22 [1] CRAN (R 4.0.0)                          
##  withr         2.4.2   2021-04-18 [1] CRAN (R 4.0.2)                          
##  xfun          0.24    2021-06-15 [1] CRAN (R 4.0.2)                          
##  xml2          1.3.2   2020-04-23 [1] CRAN (R 4.0.2)                          
##  yaml          2.2.1   2020-02-01 [1] CRAN (R 4.0.0)                          
## 
## [1] /Library/Frameworks/R.framework/Versions/4.0/Resources/library
```
