---
title: "Chapter of course"
output: html_document

---



# Topic of Course

Text text

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

In text, we can put citations like this @bookdown2016. 

## Print out session info


```r
devtools::session_info()
```

```
## ─ Session info ───────────────────────────────────────────────────────────────
##  setting  value                       
##  version  R version 4.0.2 (2020-06-22)
##  os       Ubuntu 20.04 LTS            
##  system   x86_64, linux-gnu           
##  ui       X11                         
##  language (EN)                        
##  collate  en_US.UTF-8                 
##  ctype    en_US.UTF-8                 
##  tz       Etc/UTC                     
##  date     2021-04-07                  
## 
## ─ Packages ───────────────────────────────────────────────────────────────────
##  package     * version date       lib source        
##  assertthat    0.2.1   2019-03-21 [1] RSPM (R 4.0.3)
##  backports     1.1.10  2020-09-15 [1] RSPM (R 4.0.2)
##  bookdown      0.20    2020-06-23 [1] RSPM (R 4.0.2)
##  callr         3.4.4   2020-09-07 [1] RSPM (R 4.0.2)
##  cli           2.0.2   2020-02-28 [1] RSPM (R 4.0.0)
##  colorspace    1.4-1   2019-03-18 [1] RSPM (R 4.0.0)
##  crayon        1.3.4   2017-09-16 [1] RSPM (R 4.0.0)
##  desc          1.2.0   2018-05-01 [1] RSPM (R 4.0.3)
##  devtools      2.3.2   2020-09-18 [1] RSPM (R 4.0.3)
##  digest        0.6.25  2020-02-23 [1] RSPM (R 4.0.0)
##  dplyr         1.0.2   2020-08-18 [1] RSPM (R 4.0.2)
##  ellipsis      0.3.1   2020-05-15 [1] RSPM (R 4.0.3)
##  evaluate      0.14    2019-05-28 [1] RSPM (R 4.0.3)
##  fansi         0.4.1   2020-01-08 [1] RSPM (R 4.0.0)
##  farver        2.0.3   2020-01-16 [1] RSPM (R 4.0.3)
##  fs            1.5.0   2020-07-31 [1] RSPM (R 4.0.3)
##  generics      0.0.2   2018-11-29 [1] RSPM (R 4.0.0)
##  ggplot2     * 3.3.2   2020-06-19 [1] RSPM (R 4.0.1)
##  glue          1.4.2   2020-08-27 [1] RSPM (R 4.0.3)
##  gtable        0.3.0   2019-03-25 [1] RSPM (R 4.0.3)
##  here        * 0.1     2017-05-28 [1] RSPM (R 4.0.0)
##  htmltools     0.5.0   2020-06-16 [1] RSPM (R 4.0.1)
##  knitr         1.30    2020-09-22 [1] RSPM (R 4.0.2)
##  labeling      0.3     2014-08-23 [1] RSPM (R 4.0.0)
##  lifecycle     0.2.0   2020-03-06 [1] RSPM (R 4.0.3)
##  magrittr    * 1.5     2014-11-22 [1] RSPM (R 4.0.0)
##  memoise       1.1.0   2017-04-21 [1] RSPM (R 4.0.0)
##  munsell       0.5.0   2018-06-12 [1] RSPM (R 4.0.3)
##  pillar        1.4.6   2020-07-10 [1] RSPM (R 4.0.2)
##  pkgbuild      1.1.0   2020-07-13 [1] RSPM (R 4.0.2)
##  pkgconfig     2.0.3   2019-09-22 [1] RSPM (R 4.0.3)
##  pkgload       1.1.0   2020-05-29 [1] RSPM (R 4.0.3)
##  prettyunits   1.1.1   2020-01-24 [1] RSPM (R 4.0.3)
##  processx      3.4.4   2020-09-03 [1] RSPM (R 4.0.2)
##  ps            1.3.4   2020-08-11 [1] RSPM (R 4.0.2)
##  purrr         0.3.4   2020-04-17 [1] RSPM (R 4.0.3)
##  R6            2.4.1   2019-11-12 [1] RSPM (R 4.0.0)
##  remotes       2.2.0   2020-07-21 [1] RSPM (R 4.0.3)
##  rlang         0.4.7   2020-07-09 [1] RSPM (R 4.0.2)
##  rmarkdown     2.4     2020-09-30 [1] RSPM (R 4.0.2)
##  rprojroot     1.3-2   2018-01-03 [1] RSPM (R 4.0.0)
##  scales        1.1.1   2020-05-11 [1] RSPM (R 4.0.3)
##  sessioninfo   1.1.1   2018-11-05 [1] RSPM (R 4.0.3)
##  stringi       1.5.3   2020-09-09 [1] RSPM (R 4.0.3)
##  stringr       1.4.0   2019-02-10 [1] RSPM (R 4.0.3)
##  testthat      2.3.2   2020-03-02 [1] RSPM (R 4.0.0)
##  tibble        3.0.3   2020-07-10 [1] RSPM (R 4.0.2)
##  tidyselect    1.1.0   2020-05-11 [1] RSPM (R 4.0.3)
##  usethis       1.6.3   2020-09-17 [1] RSPM (R 4.0.2)
##  vctrs         0.3.4   2020-08-29 [1] RSPM (R 4.0.2)
##  withr         2.3.0   2020-09-22 [1] RSPM (R 4.0.2)
##  xfun          0.18    2020-09-29 [1] RSPM (R 4.0.2)
##  yaml          2.2.1   2020-02-01 [1] RSPM (R 4.0.3)
## 
## [1] /usr/local/lib/R/site-library
## [2] /usr/local/lib/R/library
```

## References 

