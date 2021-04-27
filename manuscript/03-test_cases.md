# Uses cases for Bookdown to Leanpub

Including a figure from the resources. This shouldn’t be an issue in the
future

    knitr::include_graphics("resources/images/itcr_training_network.png")

<img src="resources/images/itcr_training_network.png" width="100%" />

    knitr::include_graphics("resources/images/itcr_training_network.png")

<img src="resources/images/itcr_training_network.png" title="it's a training network" alt="it's a training network" width="100%" style="display: block; margin: auto;" />

    knitr::include_graphics("resources/images/tools.png")

<img src="resources/images/tools.png" title="it's a tool" alt="it's a tool" width="100%" style="display: block; margin: auto auto auto 0;" />

    knitr::include_graphics("resources/images/tools.png")

<img src="resources/images/tools.png" title="it's a tool" alt="it's a tool" width="100%" style="display: block; margin: auto 0 auto auto;" />

    knitr::include_graphics("https://upload.wikimedia.org/wikipedia/commons/e/e9/Felis_silvestris_silvestris_small_gradual_decrease_of_quality.png")

![](https://upload.wikimedia.org/wikipedia/commons/e/e9/Felis_silvestris_silvestris_small_gradual_decrease_of_quality.png)

Including a figure from the resources. This shouldn’t be an issue in the
future

    knitr::include_url("http://www.youtube.com/embed/9bZkp7q19f0?rel=0")

[![](resources/images/unnamed-chunk-3-1.png)](http://www.youtube.com/embed/9bZkp7q19f0?rel=0)

![Introducing Markua](https://www.youtube.com/watch?t=105&v=VOCYL-FNbr0)

    knitr::include_url("https://www.youtube.com/watch?v=9bZkp7q19f0?rel=0")

[![](resources/images/unnamed-chunk-4-1.png)](https://www.youtube.com/watch?v=9bZkp7q19f0?rel=0)

    # define GS_ID
    leanbuild::include_slide("https://docs.google.com/presentation/d/1EYqqNV52cEaklZoYy8NTePiE9eJU61f8xunATYghKKg/edit#slide=id.gd06f979a42_0_107")

    knitr::include_url("https://docs.google.com/presentation/d/1cd434bkLer_CJ04GzpsZwzeEA9gjc5Ho6QimiHPbyEg/export/png?id=1cd434bkLer_CJ04GzpsZwzeEA9gjc5Ho6QimiHPbyEg&pageid=p")
