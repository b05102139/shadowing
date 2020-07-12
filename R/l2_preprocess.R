#' IPA Preprocessor
#' This function normalizes potential mistakes made by IPA transcribers.
#' @param df a dataframe which follows this package's template.
#' @export
#' @examples
#' l2_preprocess()
l2_preprocess <- function(df){
  df <- data.frame(lapply(df, function(x) {
    gsub("ː", ":", x)
  }))

  df <- data.frame(lapply(df, function(x) {
    gsub("ˈ", "'", x)
  }))
  df
}
