---
title: "Chapter of course"
output: html_document
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
citeproc: yes
---

# Figures


```r
fp = knitr::fig_path()
fp = dirname(fp)
fp = paste0("images/", fp, "/")
print(paste0("figpath is ", fp))
```

```
## [1] "figpath is images/04-figures_files/figure-html/"
```

```r
knitr::opts_chunk$set(fig.path = fp)
```

## Make a plot

This is the same code as in chapter 2, but here we can show how setting `knitr` chunks helps us tidy stuff up. 


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



```r
iris %>%
  ggplot(aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  theme_bw()
```

<img src="images/04-figures_files/figure-html/unnamed-chunk-3-1.png" width="672" />
