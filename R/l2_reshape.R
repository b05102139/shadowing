#' Shadowing CSV Reshaper
#' This function reshapes the CSV file of the shadowing experiment to a processable format.
#' @param df a dataframe that follows the template required of this package.
#' @export
#' @import magrittr
#' @examples
#' l2_reshape()
l2_reshape <- function(df){
  df[,2] <- NULL
  df <- df[which((1:nrow(df) - 1) %% 4 == 0),]

  df_2 <- lapply(1:nrow(df), function(x){
    lapply(2:ncol(df), function(y){
      adist(df[x,1], df[x,y])
    })
  })

  df_2_number <- do.call(rbind.data.frame, df_2)

  colnames(df_2_number) <- c("T1", "T2", "T3", "T4", "T5")
  rownames(df_2_number) <- c("collapse", "colleague", "comment", "commit", "communicate", "community", "compatible", "compensate", "complex", "comprehensive")

  original_len <- (nchar(df[1:nrow(df),1] %>% as.character) - 2)

  for (i in 1:nrow(df)){
    df_2_number[i,] <- df_2_number[i,] / original_len[i]
  }

  df_3 <- tibble::rownames_to_column(df_2_number, "word")
  df_3 <- reshape2::melt(df_3, id.vars = "word")

  df_3
}
