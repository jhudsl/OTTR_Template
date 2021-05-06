# Uses cases for Bookdown to Leanpub


```r
fp <- knitr::fig_path()
fp <- dirname(fp)
fp <- paste0("images/", fp, "/")
knitr::opts_chunk$set(fig.path = fp)
```

Including a figure from the resources.  This shouldn't be an issue in the future 

```r
knitr::include_graphics("resources/images/itcr_training_network.png")
```

<div class="figure">
<img src="resources/images/itcr_training_network.png" alt="caption for first figure, we need multiple so make sure it works" width="100%" />
<p class="caption">(\#fig:unnamed-chunk-2)caption for first figure, we need multiple so make sure it works</p>
</div>



```r
knitr::include_graphics("resources/images/itcr_training_network.png")
```

<img src="resources/images/itcr_training_network.png" title="THIS IS AN ALT center align it's a training network" alt="THIS IS AN ALT center align it's a training network" width="100%" style="display: block; margin: auto;" />



```r
knitr::include_graphics("resources/images/itcr_training_network.png")
```

<div class="figure" style="text-align: center">
<img src="resources/images/itcr_training_network.png" alt="THIS IS AN ALT center align it's a training network" width="100%" />
<p class="caption"> </p>
</div>



```r
knitr::include_graphics("resources/images/itcr_training_network.png")
```

<img src="resources/images/itcr_training_network.png" title="center align it's a training network" alt="center align it's a training network" width="100%" style="display: block; margin: auto;" />


```r
knitr::include_graphics("resources/images/tools.png")
```

<img src="resources/images/tools.png" title="left align it's a tool" alt="left align it's a tool" width="100%" style="display: block; margin: auto auto auto 0;" />


```r
knitr::include_graphics("resources/images/tools.png")
```

<div class="figure" style="text-align: right">
<img src="resources/images/tools.png" alt="right align it's a tool" width="100%" />
<p class="caption">(\#fig:right_tools)caption for local png</p>
</div>


```r
knitr::include_graphics("https://upload.wikimedia.org/wikipedia/commons/e/e9/Felis_silvestris_silvestris_small_gradual_decrease_of_quality.png")
```

<div class="figure">
<img src="https://upload.wikimedia.org/wikipedia/commons/e/e9/Felis_silvestris_silvestris_small_gradual_decrease_of_quality.png" alt="caption for url png"  />
<p class="caption">(\#fig:unnamed-chunk-3)caption for url png</p>
</div>


Including a figure from the resources.  This shouldn't be an issue in the future 

```r
knitr::include_url("http://www.youtube.com/embed/9bZkp7q19f0?rel=0")
```

<div class="figure">
<iframe src="http://www.youtube.com/embed/9bZkp7q19f0?rel=0" width="672" height="400px"></iframe>
<p class="caption">(\#fig:unnamed-chunk-4)url cap</p>
</div>


```r
knitr::include_url("http://www.youtube.com/embed/9bZkp7q19f0?rel=0")
```

<iframe src="http://www.youtube.com/embed/9bZkp7q19f0?rel=0" width="672" height="400px"></iframe>

![Introducing Markua](https://www.youtube.com/watch?t=105&v=VOCYL-FNbr0)



```r
knitr::include_url("https://www.youtube.com/watch?v=9bZkp7q19f0?rel=0")
```

<div class="figure">
<iframe src="https://www.youtube.com/watch?v=9bZkp7q19f0?rel=0" width="672" height="400px"></iframe>
<p class="caption">(\#fig:unnamed-chunk-5)caption for url</p>
</div>


```r
# define GS_ID
leanbuild::include_slide("https://docs.google.com/presentation/d/12DPZgPteQBwgal6kSPP58zhPhjZ7QSPZLe3NkA8M3eo/edit#slide=id.gc87451c247_0_17", overwrite = FALSE)
```

![](images/03-test_cases_files/figure-html//12DPZgPteQBwgal6kSPP58zhPhjZ7QSPZLe3NkA8M3eo_gc87451c247_0_17.png)<!-- -->


```r
# define GS_ID
leanbuild::include_slide("https://docs.google.com/presentation/d/12DPZgPteQBwgal6kSPP58zhPhjZ7QSPZLe3NkA8M3eo/edit#slide=id.gc87451c247_0_17", overwrite = FALSE)
```

<img src="images/03-test_cases_files/figure-html//12DPZgPteQBwgal6kSPP58zhPhjZ7QSPZLe3NkA8M3eo_gc87451c247_0_17.png" title="picture of stuff" alt="picture of stuff"  />





```r
knitr::include_url("https://docs.google.com/presentation/d/1cd434bkLer_CJ04GzpsZwzeEA9gjc5Ho6QimiHPbyEg/export/png?id=1cd434bkLer_CJ04GzpsZwzeEA9gjc5Ho6QimiHPbyEg&pageid=p")
```



