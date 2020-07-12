#' Title
#'
#' @param reshaped_df
#' @param word_to_subset
#'
#' @return
#' @export
#'
#' @examples
word_subset <- function(reshaped_df, word_to_subset){
  reshaped_df %>% subset(word == word_to_subset)
}
