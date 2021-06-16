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
## here() starts at /home/rstudio
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

<img src="02-chapter_of_course_files/figure-html/unnamed-chunk-3-1.png" width="672" />


```r
ggsave(file.path(output_dir, "test_ggplot2.png"))
```

```
## Saving 7 x 5 in image
```

### Image examples

![](resources/images/itcr_training_network.png)

![](resources/images/tools.png)

### Video example

![Introducing Markua](https://www.youtube.com/watch?t=105&v=VOCYL-FNbr0)

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
##  date     2021-06-16                  
## 
## ─ Packages ───────────────────────────────────────────────────────────────────
##  package     * version date       lib source        
##  abind         1.4-5   2016-07-21 [1] RSPM (R 4.0.3)
##  assertthat    0.2.1   2019-03-21 [1] RSPM (R 4.0.3)
##  bitops        1.0-6   2013-08-17 [1] RSPM (R 4.0.3)
##  blob          1.2.1   2020-01-20 [1] RSPM (R 4.0.3)
##  bookdown      0.22    2021-04-22 [1] CRAN (R 4.0.2)
##  cachem        1.0.4   2021-02-13 [1] CRAN (R 4.0.2)
##  callr         3.7.0   2021-04-20 [1] CRAN (R 4.0.2)
##  cli           2.5.0   2021-04-26 [1] CRAN (R 4.0.2)
##  colorspace    1.4-1   2019-03-18 [1] RSPM (R 4.0.0)
##  crayon        1.4.1   2021-02-08 [1] CRAN (R 4.0.2)
##  DBI           1.1.0   2019-12-15 [1] RSPM (R 4.0.0)
##  desc          1.3.0   2021-03-05 [1] CRAN (R 4.0.2)
##  devtools      2.3.2   2020-09-18 [1] RSPM (R 4.0.3)
##  digest        0.6.27  2020-10-24 [1] CRAN (R 4.0.2)
##  dplyr         1.0.6   2021-05-05 [1] CRAN (R 4.0.2)
##  ellipsis      0.3.2   2021-04-29 [1] CRAN (R 4.0.2)
##  evaluate      0.14    2019-05-28 [1] RSPM (R 4.0.3)
##  fansi         0.4.2   2021-01-15 [1] CRAN (R 4.0.2)
##  farver        2.0.3   2020-01-16 [1] RSPM (R 4.0.3)
##  fastmap       1.1.0   2021-01-25 [1] CRAN (R 4.0.2)
##  fs            1.5.0   2020-07-31 [1] RSPM (R 4.0.3)
##  generics      0.1.0   2020-10-31 [1] CRAN (R 4.0.2)
##  ggplot2     * 3.3.2   2020-06-19 [1] RSPM (R 4.0.1)
##  glue          1.4.2   2020-08-27 [1] RSPM (R 4.0.3)
##  gtable        0.3.0   2019-03-25 [1] RSPM (R 4.0.3)
##  here        * 0.1     2017-05-28 [1] RSPM (R 4.0.0)
##  highr         0.9     2021-04-16 [1] CRAN (R 4.0.2)
##  htmltools     0.5.1.1 2021-01-22 [1] CRAN (R 4.0.2)
##  knitr         1.33    2021-04-24 [1] CRAN (R 4.0.2)
##  labeling      0.3     2014-08-23 [1] RSPM (R 4.0.0)
##  lifecycle     1.0.0   2021-02-15 [1] CRAN (R 4.0.2)
##  magrittr    * 2.0.1   2020-11-17 [1] CRAN (R 4.0.2)
##  memoise       2.0.0   2021-01-26 [1] CRAN (R 4.0.2)
##  munsell       0.5.0   2018-06-12 [1] RSPM (R 4.0.3)
##  oro.nifti   * 0.11.0  2020-09-08 [1] RSPM (R 4.0.2)
##  pillar        1.6.0   2021-04-13 [1] CRAN (R 4.0.2)
##  pkgbuild      1.1.0   2020-07-13 [1] RSPM (R 4.0.2)
##  pkgconfig     2.0.3   2019-09-22 [1] RSPM (R 4.0.3)
##  pkgload       1.1.0   2020-05-29 [1] RSPM (R 4.0.3)
##  prettyunits   1.1.1   2020-01-24 [1] RSPM (R 4.0.3)
##  processx      3.5.2   2021-04-30 [1] CRAN (R 4.0.2)
##  ps            1.6.0   2021-02-28 [1] CRAN (R 4.0.2)
##  purrr         0.3.4   2020-04-17 [1] RSPM (R 4.0.3)
##  R6            2.5.0   2020-10-28 [1] CRAN (R 4.0.2)
##  Rcpp          1.0.6   2021-01-15 [1] CRAN (R 4.0.2)
##  remotes       2.2.0   2020-07-21 [1] RSPM (R 4.0.3)
##  rlang         0.4.11  2021-04-30 [1] CRAN (R 4.0.2)
##  rmarkdown     2.8     2021-05-07 [1] CRAN (R 4.0.2)
##  RNifti        1.2.2   2020-09-07 [1] RSPM (R 4.0.2)
##  rprojroot     2.0.2   2020-11-15 [1] CRAN (R 4.0.2)
##  scales        1.1.1   2020-05-11 [1] RSPM (R 4.0.3)
##  sessioninfo   1.1.1   2018-11-05 [1] RSPM (R 4.0.3)
##  stringi       1.6.1   2021-05-10 [1] CRAN (R 4.0.2)
##  stringr       1.4.0   2019-02-10 [1] RSPM (R 4.0.3)
##  testthat      2.3.2   2020-03-02 [1] RSPM (R 4.0.0)
##  tibble        3.1.1   2021-04-18 [1] CRAN (R 4.0.2)
##  tidyselect    1.1.1   2021-04-30 [1] CRAN (R 4.0.2)
##  usethis       2.0.1   2021-02-10 [1] CRAN (R 4.0.2)
##  utf8          1.2.1   2021-03-12 [1] CRAN (R 4.0.2)
##  vctrs         0.3.8   2021-04-29 [1] CRAN (R 4.0.2)
##  withr         2.4.2   2021-04-18 [1] CRAN (R 4.0.2)
##  xfun          0.22    2021-03-11 [1] CRAN (R 4.0.2)
##  yaml          2.2.1   2020-02-01 [1] RSPM (R 4.0.3)
## 
## [1] /usr/local/lib/R/site-library
## [2] /usr/local/lib/R/library
```
