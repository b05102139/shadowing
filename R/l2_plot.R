#' Plot Function of Shadowing Improvement
#' This function plots improvement of shadowing experiments, by comparing the subjects' IPA transcription with an assumed "standard" IPA.
#' @param reshaped_df a dataframe processed by the l2_reshape function.
#' @export
#' @import ggplot2
#' @examples
#' l2_plot()
l2_plot <- function(reshaped_df){
  ggplot(reshaped_df, aes(x = variable, y = value)) +
    geom_line(aes(color = word, group = word)) +
    ggrepel::geom_label_repel(data = reshaped_df %>% subset(variable == "T5"), aes(label = word, color = word), na.rm = T) +
    theme_minimal()
}
