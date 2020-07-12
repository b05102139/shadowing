#' Title
#'
#' @param subset_word
#'
#' @return
#' @export
#'
#' @examples
relapse_detect <- function(subset_word){
  for(i in 1:5){
    if((subset_word[i,][3] %>%
               unlist < subset_word[i + 1,][3] %>%
               unlist) && i != 5){
      print_word <- subset_word %>% `[[`(1) %>% unique
      print_t <- paste0("T", i)
      result <- c(print_word, print_t)
      print(result)
    }
  }
}
