# Uses cases for Bookdown to Leanpub

Including a figure from the resources.  This shouldn't be an issue in the future 

```r
knitr::include_graphics("resources/images/itcr_training_network.png")
```

{alt: "caption for first figure, we need multiple so make sure it works", width: "100%", align: "middle"}
![(\#fig:unnamed-chunk-1)caption for first figure, we need multiple so make sure it works](resources/images/itcr_training_network.png)



```r
knitr::include_graphics("resources/images/itcr_training_network.png")
```

{alt: "THIS IS AN ALT center align it's a training network", width: "100%", align: "middle"}
![](resources/images/itcr_training_network.png)



```r
knitr::include_graphics("resources/images/itcr_training_network.png")
```

{alt: "THIS IS AN ALT center align it's a training network", width: "100%", align: "middle"}
![ ](resources/images/itcr_training_network.png)



```r
knitr::include_graphics("resources/images/itcr_training_network.png")
```

{alt: "center align it's a training network", width: "100%", align: "middle"}
![](resources/images/itcr_training_network.png)


```r
knitr::include_graphics("resources/images/tools.png")
```

{alt: "left align it's a tool", width: "100%", align: "left"}
![](resources/images/tools.png)


```r
knitr::include_graphics("resources/images/tools.png")
```

{alt: "right align it's a tool", width: "100%", align: "right"}
![(\#fig:right_tools)caption for local png](resources/images/tools.png)


```r
knitr::include_graphics("https://upload.wikimedia.org/wikipedia/commons/e/e9/Felis_silvestris_silvestris_small_gradual_decrease_of_quality.png")
```

{alt: "caption for url png", align: "middle"}
![(\#fig:unnamed-chunk-2)caption for url png](https://upload.wikimedia.org/wikipedia/commons/e/e9/Felis_silvestris_silvestris_small_gradual_decrease_of_quality.png)


Including a figure from the resources.  This shouldn't be an issue in the future 

```r
knitr::include_url("http://www.youtube.com/embed/9bZkp7q19f0?rel=0")
```

{height: "400px", width: "672", align: "middle"}
![(\#fig:unnamed-chunk-3)url cap](http://www.youtube.com/embed/9bZkp7q19f0?rel=0)

![Introducing Markua](https://www.youtube.com/watch?t=105&v=VOCYL-FNbr0)



```r
knitr::include_url("https://www.youtube.com/watch?v=9bZkp7q19f0?rel=0")
```

{height: "400px", width: "672", align: "middle"}
![(\#fig:unnamed-chunk-4)caption for url](https://www.youtube.com/watch?v=9bZkp7q19f0?rel=0)


```r
# define GS_ID
leanbuild::include_slide("https://docs.google.com/presentation/d/12DPZgPteQBwgal6kSPP58zhPhjZ7QSPZLe3NkA8M3eo/edit#slide=id.gc87451c247_0_17", overwrite = FALSE)
```

{width: "480", align: "middle"}
![](03-test_cases_files/figure-html//12DPZgPteQBwgal6kSPP58zhPhjZ7QSPZLe3NkA8M3eo_gc87451c247_0_17.png)




```r
knitr::include_url("https://docs.google.com/presentation/d/1cd434bkLer_CJ04GzpsZwzeEA9gjc5Ho6QimiHPbyEg/export/png?id=1cd434bkLer_CJ04GzpsZwzeEA9gjc5Ho6QimiHPbyEg&pageid=p")
```




