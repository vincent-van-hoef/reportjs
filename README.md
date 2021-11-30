## Aim

This packages allows for dropdown menus to select which figure to show in Bookdown reports. It is based on bootstrap-select and the Bootstrap toolkit. For now, it consists of a single function to be used in a R chunk in the Rmd file. 

## Usage

First create a named vector with the relative paths to the figures as elements. The names of the vector will be the elements of the dropdown menu.

```{r}
plots <- list.files("../Results", full.names = TRUE)
names(plots) <- c("ADA", "AXIN1", "C5a")

reportjs::dropdown(plots, style = "btn-info", selected = "C5a", frame_width = "75%", height = "5px")
```

## Drawbacks

BOTH PARTIALLY FIXED BY ADDING SINZING INFO IN FUNCTION CALL

This works best with the newer bookdown formats such as bs4_book because the sizing of the figures is more stable in those formats. In for example gitbook; the figure stretches when the size of the html is changed..

In addition, there is an annoying whitespace under the figure which I so far have not been able to remove.
