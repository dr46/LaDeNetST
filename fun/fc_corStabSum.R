# fc_corStabSum.R
# Correlations for centrality stability summaries

cs.sum <- function(stability_list) {
  metric_names <- colnames(stability_list[[1]])
  result <- list()
  
  for (metric in metric_names) {
    summary_df <- do.call(rbind, lapply(seq_along(stability_list), function(i) {
      prop_name <- names(stability_list)[i]
      proportion_value <- as.numeric(gsub("prop_", "", prop_name))
      values <- stability_list[[i]][[metric]]
      
      mean_val <- mean(values, na.rm = TRUE)
      se <- sd(values, na.rm = TRUE) / sqrt(sum(!is.na(values)))
      ci <- 1.96 * se
      
      data.frame(
        Proportion = proportion_value,
        Mean = mean_val,
        CI_Lower = mean_val - ci,
        CI_Upper = mean_val + ci
      )
    }))
    
    result[[metric]] <- summary_df[order(summary_df$Proportion, decreasing = TRUE), ]
  }
  
  return(result)
}
