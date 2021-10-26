
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

theme_INLA <- function(){
  ret_theme <- theme(
    
  )
  return(ret_theme)
}