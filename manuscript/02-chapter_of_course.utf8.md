---
title: "Chapter of course"
output: html_document

---



# Topic of Course

Text text

## Subtopic

Text Text 


```r
iris %>% 
  ggplot(aes(Sepal.Length, Sepal.Width, color = Species)) + 
  geom_point() + 
  theme_bw()
```

![](resources/images/unnamed-chunk-2-1.png)



```r
ggsave(file.path("test_ggplot2.png"))
```

```
## Saving 7 x 7 in image
```

![](images/itcr_training_network.png)

More text

![](images/tools.png)

### Subtopic of subtopic


![](images/Image_res_72.png)

Embedded video:

html way - (good for bookdown & not for Leanpub):
<iframe width="560" height="315" src="https://www.youtube.com/embed/VOCYL-FNbr0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

For Leanpub (does not work for bookdown):
![Introducing Markua](https://www.youtube.com/watch?t=105&v=VOCYL-FNbr0)

Markdown way- (good for bookdown (but defaults to small image) & does not work for Leanpub):
[![Introducing Markua](http://img.youtube.com/vi/VOCYL-FNbr0/mqdefault.jpg)](https://www.youtube.com/watch?t=105&v=VOCYL-FNbr0)

Markdown way with bigger image- (good for bookdown  & does not work for Leanpub):
[![Introducing Markua](http://img.youtube.com/vi/VOCYL-FNbr0/mqdefault.jpg){ width=60% }](https://www.youtube.com/watch?t=105&v=VOCYL-FNbr0)

