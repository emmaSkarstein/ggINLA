


#' Convert list of parameter marginals to data frame
#'
#' @param inla_res 
#' @param type "fixed" or "hyperpar"
#'
#' @return
#' @export
#'
#' @examples
INLA2long <- function(inla_res, type = "fixed"){
  marg_type <- paste0("marginals.", type)
  margs <- inla_res[[marg_type]]
  marg_df_long <- as.data.frame(margs) %>% 
    gather(key = variable, value = value) %>% 
    separate(col = variable, into = c("variable", "coordinate"), sep = -1) %>% 
    mutate(variable = substr(variable, start = 1, stop = nchar(variable)-1)) 
  
  marg_df_x <- marg_df_long %>% filter(coordinate == "x")
  marg_df_y <- marg_df_long %>% filter(coordinate == "y")
  
  marg_df <- data.frame(variable = marg_df_x$variable, x = marg_df_x$value, y = marg_df_y$value)
  return(marg_df)
}

#' Convert all parameter marginals for INLA object to data frame
#'
#' @param inla_res 
#'
#' @return
#' @export
#'
#' @examples
ReturnMarginalDF <- function(inla_res){
  fixed_df <- INLA2long(inla_res, type = "fixed") %>% mutate(id = "fixed")
  hyper_df <- INLA2long(inla_res, type = "hyperpar") %>% mutate(id = "hyper")
  all_marginals <- bind_rows(fixed_df, hyper_df, .id = "id") 
  return(all_marginals)
}
  