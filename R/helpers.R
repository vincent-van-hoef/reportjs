#' @import htmltools
#' @note code borrowed here from Shiny's selectInput
selectOptions <- function(choices, selected = NULL) {
  if (is.null(names(choices))) choices <- setNames(choices, choices)

  html <- mapply(choices, names(choices), FUN = function(choice, label) {
    sprintf(
      '<option value="%s"%s>%s</option>',
      htmltools::htmlEscape(choice, TRUE),
      if (label %in% selected) ' selected' else '',
      htmltools::htmlEscape(label)
    )
  }
  )

  htmltools::HTML(paste(html, collapse = '\n'))
}


#' @import htmltools
buildHTML <- function(choices, selected = NULL,
                      height = "500", width = "100%", dropdownAlignRight = FALSE,
                      dropupAuto = TRUE, header = FALSE, liveSearch = FALSE, boxWidth = FALSE,
                      liveSearchStyle = c("contains", "startsWith"), showTick = FALSE, size = "auto",
                      style = NULL) {

  id1 <- stringi::stri_rand_strings(1, 10)

  id2 <- stringi::stri_rand_strings(1, 10)

  l <- function(x) return(tolower(as.character(x)))

  select_tag <- htmltools::tags$select(
    id = id1,
    class = "selectpicker",
    `data-dropdown-align-right` = l(dropdownAlignRight),
    `data-dropup-auto` = l(dropupAuto),
    `data-header` = l(header),
    `data-live-search` = l(liveSearch),
    `data-live-search-style` = liveSearchStyle,
    `data-show-tick` = l(showTick),
    `data-width` = l(boxWidth),
    `data-size` = l(size),
    `data-style` = style,
    selectOptions(choices, selected)
  )

  if (is.null(selected)) {
    sel <- choices[1]
  } else {
    index <- match(selected, names(choices))
    sel <- choices[index]
  }

    js <- paste0('$(document).ready(function(){
                 $("#', id1, '").change(function(){
                 $("img[name=', id2, ']").attr("src",$(this).val());
                 });
  });')
    out <- htmltools::tags$html(select_tag,
                                htmltools::img(src = sel,
                         name = id2,
                         #height = as.character(height),
                         width = as.character(width)),
                         htmltools::tags$script(htmlwidgets::JS(js)))
    return(htmltools::renderTags(out, indent = FALSE))
}
