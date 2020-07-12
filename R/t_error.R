#' Title
#'
#' @param reshaped_df
#' @param t_number
#'
#' @return
#' @export
#'
#' @examples
t_error <- function(reshaped_df, t_number){
  t_list <- subset(reshaped_df, variable == t_number)
  t_list[order(t_list$value, decreasing = T),]
}
