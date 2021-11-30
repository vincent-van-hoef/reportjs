#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
dropdown <- function(vector, selected = NULL,
                     frame_height = "auto", frame_width = "100%", align_right = FALSE,
                     dropup_auto = TRUE, header = FALSE, live_search = FALSE, box_width = FALSE,
                     live_search_style = "contains", show_tick = FALSE, size = "auto",
                     style = NULL, width = NULL, height = NULL, elementId = NULL, ...) {

  # forward options using x
  opts = list(
  )

  # create widget
  widg <- htmlwidgets::createWidget(
    name = 'dropdown',
    x = opts,
    width = "10px",
    height = "10px",
    package = 'reportjs',
    elementId = elementId)

  # Prepend the HTML content to the widget

  out <- htmlwidgets::prependContent(widg, buildHTML(choices = vector,
                                                     selected = selected,
                                                     dropdownAlignRight = align_right,
                                                     dropupAuto = dropup_auto,
                                                     header = header,
                                                     liveSearch = live_search,
                                                     liveSearchStyle = live_search_style,
                                                     showTick = show_tick,
                                                     size = size,
                                                     style = style,
                                                     height = frame_height,
                                                     width = frame_width
  ))

  out

}

#' Shiny bindings for dropdown
#'
#' Output and render functions for using dropdown within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a dropdown
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name dropdown-shiny
#'
#' @export
dropdownOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'dropdown', width, height, package = 'reportjs')
}

#' @rdname dropdown-shiny
#' @export
renderDropdown <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, dropdownOutput, env, quoted = TRUE)
}
