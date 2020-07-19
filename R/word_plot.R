#' Plot Function of Single Word Shadowing Improvement
#' This function plots the shadowing improvement of a single word
#' @param reshaped_df
#' @param word_to_plot
#'
#' @return
#' @export
#'
#' @examples
word_plot <- function(reshaped_df, word_to_plot){
  subset_to_plot <- word_subset(reshaped_df, word_to_plot)
  ggplot(subset_to_plot) +
    geom_path(aes(x = variable, y = value, group = 1, color = word)) +
    theme_minimal()
}
