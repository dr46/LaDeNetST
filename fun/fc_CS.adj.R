# fc_CS.adj.R
# Case stability from adjacency matrix

CS.adj <- function(adj_matrix, 
                   n = 1000, 
                   n_iter = 100, 
                   proportions = c(0.95, 0.872, 0.795, 0.717, 0.639, 
                                   0.561, 0.483, 0.405, 0.328, 0.25),
                   method = "ggm", verbose = TRUE) {
  if (!requireNamespace("MASS", quietly = TRUE)) stop("Please, load 'MASS' package")
  if (!requireNamespace("qgraph", quietly = TRUE)) stop("Please, load 'qgraph' package")
  if (!requireNamespace("bootnet", quietly = TRUE)) stop("Please load 'bootnet' package")

  # Complementary function to capture centrality statistics
  get_centrality <- function(cent_list, type) {
    df <- cent_list$node.centrality
    if (!(type %in% colnames(df))) stop(paste("Centrality not found:", type))
    return(df[[type]])
  }

  # Correlation matrix
  cor_matrix <- adj_matrix
  diag(cor_matrix) <- 1
  cor_matrix <- (cor_matrix + t(cor_matrix)) / 2

  if (!all(eigen(cor_matrix)$values > 0)) stop("Matrix is not positive definited.")

  # Simulating cases - full sample size
  sim_data <- MASS::mvrnorm(n = n, mu = rep(0, ncol(cor_matrix)), Sigma = cor_matrix)
  colnames(sim_data) <- paste0("V", 1:ncol(cor_matrix))

  # Network estimation
  full_net <- bootnet::estimateNetwork(sim_data, default = method)
  full_cent <- qgraph::centrality_auto(full_net$graph)

  # Results list
  results <- list()

  for (p in proportions) {
    if (verbose) message(paste0("Testing proportion: ", p))
    cor_strength <- numeric(n_iter)
    cor_closeness <- numeric(n_iter)
    cor_betweenness <- numeric(n_iter)
    cor_expectedInf <- numeric(n_iter)

    for (i in 1:n_iter) {
      idx <- sample(1:n, size = round(n * p), replace = FALSE)
      sub_data <- sim_data[idx, ]
      sub_net <- bootnet::estimateNetwork(sub_data, default = method)
      sub_cent <- qgraph::centrality_auto(sub_net$graph)

      # Correlations with full graph
      cor_strength[i] <- cor(get_centrality(full_cent, "Strength"), get_centrality(sub_cent, "Strength"))
      cor_closeness[i] <- cor(get_centrality(full_cent, "Closeness"), get_centrality(sub_cent, "Closeness"))
      cor_betweenness[i] <- cor(get_centrality(full_cent, "Betweenness"), get_centrality(sub_cent, "Betweenness"))
      cor_expectedInf[i] <- cor(get_centrality(full_cent, "ExpectedInfluence"), get_centrality(sub_cent, "ExpectedInfluence"))
    }

    results[[paste0("prop_", p)]] <- data.frame(
      Strength = cor_strength,
      Closeness = cor_closeness,
      Betweenness = cor_betweenness,
      ExpectedInfluence = cor_expectedInf
    )
  }

  return(results)
}
