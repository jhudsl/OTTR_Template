---
title: "Chapter of course"
output: html_document
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
citeproc: yes
---

## Learning Objectives

This chapter will cover:  

- {You can use https://www.bu.edu/cme/forms/RSS_forms/tips_for_writing_objectives.pdf to define some learning objectives here}
- {Another learning objective}

## Libraries

For this chapter, we'll need the following packages attached. 


```r
library(here)
```

```
## here() starts at /Users/johnmuschelli/Dropbox/Projects/ITCR_Course_Template
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
img = oro.nifti::nifti()
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
##  version  R version 4.0.5 (2021-03-31)
##  os       macOS Catalina 10.15.7      
##  system   x86_64, darwin17.0          
##  ui       X11                         
##  language (EN)                        
##  collate  en_US.UTF-8                 
##  ctype    en_US.UTF-8                 
##  tz       America/New_York            
##  date     2021-04-29                  
## 
## ─ Packages ───────────────────────────────────────────────────────────────────
##  package     * version date       lib source                            
##  abind         1.4-5   2016-07-21 [2] CRAN (R 4.0.0)                    
##  assertthat    0.2.1   2019-03-21 [2] CRAN (R 4.0.0)                    
##  bitops        1.0-6   2013-08-17 [2] CRAN (R 4.0.0)                    
##  bookdown      0.21    2020-10-13 [1] CRAN (R 4.0.2)                    
##  bslib         0.2.4   2021-01-25 [1] CRAN (R 4.0.2)                    
##  cachem        1.0.4   2021-02-13 [1] CRAN (R 4.0.2)                    
##  callr         3.7.0   2021-04-20 [1] CRAN (R 4.0.5)                    
##  cli           2.5.0   2021-04-26 [1] CRAN (R 4.0.2)                    
##  colorout    * 1.2-2   2020-06-01 [2] Github (jalvesaq/colorout@726d681)
##  colorspace    2.0-0   2020-11-11 [1] CRAN (R 4.0.2)                    
##  crayon        1.4.1   2021-02-08 [1] CRAN (R 4.0.2)                    
##  DBI           1.1.1   2021-01-15 [1] CRAN (R 4.0.2)                    
##  desc          1.3.0   2021-03-05 [1] CRAN (R 4.0.2)                    
##  devtools      2.4.0   2021-04-07 [1] CRAN (R 4.0.2)                    
##  digest        0.6.27  2020-10-24 [1] CRAN (R 4.0.2)                    
##  dplyr         1.0.5   2021-03-05 [1] CRAN (R 4.0.2)                    
##  ellipsis      0.3.1   2020-05-15 [2] CRAN (R 4.0.0)                    
##  evaluate      0.14    2019-05-28 [2] CRAN (R 4.0.0)                    
##  fansi         0.4.2   2021-01-15 [1] CRAN (R 4.0.2)                    
##  farver        2.1.0   2021-02-28 [1] CRAN (R 4.0.2)                    
##  fastmap       1.1.0   2021-01-25 [1] CRAN (R 4.0.2)                    
##  fs            1.5.0   2020-07-31 [2] CRAN (R 4.0.2)                    
##  generics      0.1.0   2020-10-31 [1] CRAN (R 4.0.2)                    
##  ggplot2     * 3.3.3   2020-12-30 [1] CRAN (R 4.0.2)                    
##  glue          1.4.2   2020-08-27 [1] CRAN (R 4.0.2)                    
##  gtable        0.3.0   2019-03-25 [2] CRAN (R 4.0.0)                    
##  here        * 1.0.1   2020-12-13 [1] CRAN (R 4.0.2)                    
##  highr         0.9     2021-04-16 [1] CRAN (R 4.0.2)                    
##  htmltools     0.5.1.1 2021-01-22 [1] CRAN (R 4.0.2)                    
##  jquerylib     0.1.3   2020-12-17 [1] CRAN (R 4.0.2)                    
##  jsonlite      1.7.2   2020-12-09 [1] CRAN (R 4.0.2)                    
##  knitr         1.33    2021-04-24 [1] CRAN (R 4.0.2)                    
##  labeling      0.4.2   2020-10-20 [1] CRAN (R 4.0.2)                    
##  leanbuild     0.1.1   2021-04-29 [1] local                             
##  lifecycle     1.0.0   2021-02-15 [1] CRAN (R 4.0.2)                    
##  magrittr    * 2.0.1   2020-11-17 [1] CRAN (R 4.0.2)                    
##  memoise       2.0.0   2021-01-26 [1] CRAN (R 4.0.2)                    
##  munsell       0.5.0   2018-06-12 [2] CRAN (R 4.0.0)                    
##  oro.nifti   * 0.11.0  2020-09-04 [2] local                             
##  pillar        1.6.0   2021-04-13 [1] CRAN (R 4.0.2)                    
##  pkgbuild      1.2.0   2020-12-15 [1] CRAN (R 4.0.2)                    
##  pkgconfig     2.0.3   2019-09-22 [2] CRAN (R 4.0.0)                    
##  pkgload       1.2.1   2021-04-06 [1] CRAN (R 4.0.2)                    
##  prettyunits   1.1.1   2020-01-24 [2] CRAN (R 4.0.0)                    
##  processx      3.5.1   2021-04-04 [1] CRAN (R 4.0.2)                    
##  ps            1.6.0   2021-02-28 [1] CRAN (R 4.0.2)                    
##  purrr         0.3.4   2020-04-17 [2] CRAN (R 4.0.0)                    
##  R6            2.5.0   2020-10-28 [1] CRAN (R 4.0.2)                    
##  Rcpp          1.0.6   2021-01-15 [1] CRAN (R 4.0.2)                    
##  remotes       2.3.0   2021-04-01 [1] CRAN (R 4.0.2)                    
##  rlang         0.4.10  2020-12-30 [1] CRAN (R 4.0.2)                    
##  rmarkdown     2.7     2021-02-19 [1] CRAN (R 4.0.2)                    
##  RNifti        1.3.0   2020-12-04 [1] CRAN (R 4.0.2)                    
##  rprojroot     2.0.2   2020-11-15 [1] CRAN (R 4.0.2)                    
##  rstudioapi    0.13    2020-11-12 [1] CRAN (R 4.0.2)                    
##  sass          0.3.1   2021-01-24 [1] CRAN (R 4.0.2)                    
##  scales        1.1.1   2020-05-11 [2] CRAN (R 4.0.0)                    
##  sessioninfo   1.1.1   2018-11-05 [2] CRAN (R 4.0.0)                    
##  stringi       1.5.3   2020-09-09 [1] CRAN (R 4.0.2)                    
##  stringr       1.4.0   2019-02-10 [2] CRAN (R 4.0.0)                    
##  testthat      3.0.2   2021-02-14 [1] CRAN (R 4.0.2)                    
##  tibble        3.1.1   2021-04-18 [1] CRAN (R 4.0.2)                    
##  tidyselect    1.1.0   2020-05-11 [2] CRAN (R 4.0.0)                    
##  usethis       2.0.1   2021-02-10 [1] CRAN (R 4.0.2)                    
##  utf8          1.2.1   2021-03-12 [1] CRAN (R 4.0.2)                    
##  vctrs         0.3.7   2021-03-29 [1] CRAN (R 4.0.2)                    
##  withr         2.4.2   2021-04-18 [1] CRAN (R 4.0.2)                    
##  xfun          0.22    2021-03-11 [1] CRAN (R 4.0.2)                    
##  yaml          2.2.1   2020-02-01 [2] CRAN (R 4.0.0)                    
## 
## [1] /Users/johnmuschelli/Library/R/4.0/library
## [2] /Library/Frameworks/R.framework/Versions/4.0/Resources/library
```
