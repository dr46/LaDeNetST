# fc_compare_graph_edges.R
# A function to compare the edges in two graphs from matrix adjacency


compare_graph_edges <- function(g1, g2) {
  # Edges as ordered strings
  edge_list_g1 <- apply(ends(g1, E(g1)), 1, function(x) paste(sort(x), collapse = "-"))
  edge_list_g2 <- apply(ends(g2, E(g2)), 1, function(x) paste(sort(x), collapse = "-"))
  
  # Comparing
  common_edges <- intersect(edge_list_g1, edge_list_g2)
  unique_g1 <- setdiff(edge_list_g1, edge_list_g2)
  unique_g2 <- setdiff(edge_list_g2, edge_list_g1)
  
  # Produce data frame with added NAs as ""
  max_len <- max(length(common_edges), length(unique_g1), length(unique_g2))
  df <- data.frame(
    common = c(common_edges, rep("", max_len - length(common_edges))),
    unique_g1 = c(unique_g1, rep("", max_len - length(unique_g1))),
    unique_g2 = c(unique_g2, rep("", max_len - length(unique_g2)))
  )
  
  return(df)
}

