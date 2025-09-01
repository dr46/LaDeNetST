# fc_combined_effect_size.R
# Function to add effect sizes in to gtsummary tables

combined_effect_size <- function(data, variable, by) {
  x <- data[[variable]]
  y <- data[[by]]
  
  if (is.numeric(x)) {
    # Student t
    test <- t.test(x ~ y)
    t_value <- test$statistic
    df <- test$parameter
    r <- sqrt(t_value^2 / (t_value^2 + df))
    stat <- paste0("r = ", round(r, 3))
  } else {
    # Ji-squared and Cramér's V
    tbl <- table(x, y)
    test <- chisq.test(tbl)
    n <- sum(tbl)
    k <- min(dim(tbl))
    V <- sqrt(test$statistic / (n * (k - 1)))
    stat <- paste0("V = ", round(V, 3))
  }
  
  tibble(variable = variable, effect_size = stat)
}



