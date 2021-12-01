## Aim

This packages allows for dropdown menus to select which figure to show in Bookdown and Rmarkdown reports without having to use something like Shiny. This means this can also be used in stand-aline offline reports. It is based on bootstrap-select and the Bootstrap toolkit. For now, it consists of a single function to be used in a R chunk in the Rmd file. This adaptation is heavily based on the package bsselectR which did not work for pdf figures.

## Usage

Install the package with devtools.

```
devtools::install_github("vincent-van-hoef/reportjs")
library("reportjs")
```

In a R chunk, create a named vector with the relative paths to the figures as elements. The names of the vector will be the elements of the dropdown menu.

```{r}
plots <- list.files("../Results", full.names = TRUE)
names(plots) <- c("ADA", "AXIN1", "C5a")

reportjs::dropdown(plots, style = "btn-info", selected = "C5a", live_search = TRUE, frame_width = "75%", height = "5px")
```

## Drawbacks

- Only works for html output.
- Knitted Rmd reports do no show the figures in the Rstudio viewer, only in a browser.
- All figures of course need to be prerendered and available to the Rmd files; i.e you will have to deliver the report and results together and keep them in the same position relative to each other.
