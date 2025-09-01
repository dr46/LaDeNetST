# 16_narrative.R
# Additional analysis to supplement narrative report

library(igraph)

source("fun/fc_compare_graph_edges.R")
source("fun/fc_df_to_tab.R")
source("fun/fc_find_cliques_with_node.R")

load("dat/sigNets12.RData"); rm(bs12, nod12, se12)
load("dat/sigNets35.RData"); rm(bs35, nod35, se35)

# The networks
nets12 <- list()

for (i in 1:length(am12)){
  nets12[[i]] <- graph_from_adjacency_matrix(am12[[i]], mode = "undirected", weighted = TRUE)
}


nets35 <- list()

for (i in 1:length(am35)){
  nets35[[i]] <- graph_from_adjacency_matrix(am35[[i]], mode = "undirected", weighted = TRUE)
}

# Edges
ecount(nets12[[1]])
ecount(nets12[[2]])

ecount(nets35[[1]])
ecount(nets35[[2]])

# Nodes
vcount(nets12[[1]])
vcount(nets12[[2]])

vcount(nets35[[1]])
vcount(nets35[[2]])

# Density
edge_density(nets12[[1]])
edge_density(nets12[[2]])

edge_density(nets35[[1]])
edge_density(nets35[[2]])

# Comparing graphs edges
comp12 <- compare_graph_edges(nets12[[1]], nets12[[2]])
gtmd(comp12, file = "tab/comp-edges12.md",
     tit = "Unique and common edges for children aged 1 to 2")

comp35 <- compare_graph_edges(nets35[[1]], nets35[[2]])
gtmd(comp35, file = "tab/comp-edges35.md",
     tit = "Unique and common edges for children aged 3 to 5")

# Cluster of completely connected nodes in networks
# Used to produce Figure 2 in article -- See the last lines in file 10_Fig_desc_Nets.R

# Low ST - 1-2 years

find_cliques_with_node(nets12[[1]], "ak2")
find_cliques_with_node(nets12[[1]], "un1")
find_cliques_with_node(nets12[[1]], "tel")

# High ST - 1-2

find_cliques_with_node(nets12[[2]], "wo1")
find_cliques_with_node(nets12[[2]], "un1")
find_cliques_with_node(nets12[[2]], "tel")

# Low ST - 3-5

find_cliques_with_node(nets35[[1]], "wo3")
find_cliques_with_node(nets35[[1]], "cou")

# High ST - 3-5

find_cliques_with_node(nets35[[2]], "di2")
find_cliques_with_node(nets35[[2]], "tur")
find_cliques_with_node(nets35[[2]], "di1")
find_cliques_with_node(nets35[[2]], "un2")

# Prevalence for the full sample
x <- 12033
n <- 12033 +  4644  
prop.test(x, n)


# Comparing prevalences in younger and older children
xs <- c(4089, 7944)
ns <- c((4089+2656), (7944+1988))
test <- prop.test(xs, ns)
test


chi2 <- test$statistic
n_total <- sum(ns)
k <- 2
# V
unname(sqrt(chi2 / (n_total * (k - 1))))

