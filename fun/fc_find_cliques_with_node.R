# fc_find_cliques_with_node.R
# Function to find fully connected clusters in a network for a node.

find_cliques_with_node <- function(graph, node_name) {
  # Ensure the node exists
  if (!(node_name %in% V(graph)$name)) {
    stop("Node not found in the graph.")
  }
  
  # Find all maximal cliques
  cliques_list <- max_cliques(graph)
  
  # Filter cliques that contain the target node
  cliques_with_node <- Filter(function(clq) node_name %in% V(graph)[clq]$name, cliques_list)
  
  # Return the list of cliques (as vertex names)
  result <- lapply(cliques_with_node, function(clq) V(graph)[clq]$name)
  return(result)
}
