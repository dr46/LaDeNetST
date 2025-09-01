# fc_cs.ci.R
# 

cs.ci <- function(ci_list, threshold = 0.7) {
  cs_results <- setNames(rep(NA, length(ci_list)), names(ci_list))
  
  for (stat in names(ci_list)) {
    df <- ci_list[[stat]]
    
    # Ordering proportions increasingly
    df <- df[order(df$Proportion), ]
    
    # Iterating proportions from the lower to the higher
    for (i in seq_len(nrow(df))) {
      prop_cutoff <- df$Proportion[i]
      subset <- df[df$Proportion >= prop_cutoff, ]
      
      # Verifying lower Confidence Interval value satisfy the threshold
      if (all(subset$CI_Lower >= threshold, na.rm = TRUE)) {
        cs_results[stat] <- prop_cutoff
        break
      }
    }
  }
  
  return(
    print(
      list(
        txt = c("Proportion of cases you can delete to mantain an equal or higher correlation than 0.7 between original and resampled data with a 95% confidence"),
        1-cs_results
      )
    )
  )
}
