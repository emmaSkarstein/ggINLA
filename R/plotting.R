
#' Plot posterior marginals from INLA model
#'
#' @param margs_df 
#'
#' @return
#' @export
#'
#' @examples
PlotMarginals <- function(margs_df){
  plot <- ggplot(margs_df, aes(x = x, y = y)) +
    geom_line() +
    facet_grid(vars(variable))
  return(plot)
}

#' INLA theme
#'
#' @return
#' @export
#'
#' @examples
theme_INLA <- function(){
  ret_theme <- ggplot2::theme(
    # AXIS FORMAT
    axis.title = element_blank(), # Remove axis names
    axis.text.y = element_blank(), # Remove y-axis text
    axis.ticks.y = element_blank(),
    # LEGEND FORMAT
    legend.position = "top",
    legend.title = element_blank(),
    # BACKGROUND FORMAT
    #panel.background = element_rect(fill = "white"), # White background
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    # FACET FORMAT
    strip.text.y = element_text(angle = 0, hjust = 0), # Horizontal, left-aligned facet label text
    strip.background = element_rect(fill = "white") # White facet background
  )
  return(ret_theme)
}