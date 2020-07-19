#' Relapse Detection
#' This function detects when an error rate goes up again mid-trial, which we take to be a sign of relapse
#' @param subset_word
#'
#' @return
#' @export
#'
#' @examples
relapse_detect <- function(subset_word){
  subset_value <- subset_word %>% `[[`(3)
  subset_value_matrix <- c(subset_value[1], rep(subset_value[2:4], each = 2),
                           subset_value[length(subset_value)]) %>%
    matrix(ncol = 2, byrow = T)

  relapse_list <- list()

  sapply(seq_along(subset_value_matrix[,1]), function(i){
    if(is.na(subset_value_matrix[i,1]) || is.na(subset_value_matrix[i,2])){
      NULL
    } else if(subset_value_matrix[i,1] > subset_value_matrix[i,2]){
      return_word <- subset_word %>% `[[`(1) %>% unique
      return_t <- paste0("T", i)
      c(return_word, return_t) %>% data.frame(stringsAsFactors = F)
    }}) %>%
    do.call(rbind, .)
}
