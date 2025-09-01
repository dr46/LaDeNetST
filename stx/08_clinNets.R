# 08_clinNets.R
# Building networks including only significant edges

library(dplyr)

load("dat/boots.12.RData")
load("dat/boots.35.RData")

####################################################################

# Boot summaries 1 - 2
bs12 <- list()

for (i in 1:length(boot12)){
  bs12[[i]] <- summary(boot12[[i]]) 
}

# Filtering significant edges
se12 <- list()

for (i in 1:length(bs12)){
    se12[[i]] <- bs12[[i]] %>%
    filter(type == "edge") %>% 
    filter(q2.5 > 0 | q97.5 < 0)
}

# Nodes names
nod12 <- list()

for (i in 1:length(se12)){
  nod12[[i]] <- sort(unique(c(se12[[i]]$node1, se12[[i]]$node2)))
}

# Adjacency matrices
am12 <- vector("list", length(se12))

# Fill matrices with 0
# squared matrices with 0
for (i in seq_along(nod12)) {
  nodos <- nod12[[i]]
  
  matriz <- matrix(0, nrow = length(nodos), ncol = length(nodos),
                   dimnames = list(nodos, nodos))
  
  am12[[i]] <- matriz
}


# Fill in adjacency matrices
for (j in seq_along(se12)) {
  enlaces <- se12[[j]]      # Significant edges dataframe
  matriz <- am12[[j]]       # Extracting matrix
  
  for (i in seq_len(nrow(enlaces))) {
    from <- enlaces$node1[i]
    to <- enlaces$node2[i]
    peso <- enlaces$mean[i]
    
    if (from %in% rownames(matriz) && to %in% colnames(matriz)) {
      matriz[from, to] <- peso
      matriz[to, from] <- peso
    }
  }
  
  # Saving updated matrix in list 
  am12[[j]] <- matriz
}

rm(i, j, from, nodos, peso, to, enlaces, matriz)

save(am12, bs12, nod12, se12, file = "dat/sigNets12.RData")
rm(am12, bs12, nod12, se12, boot12)

# To produce graphs [...]


####################################################################

####################################################################

# Boot summaries 3 - 5
bs35 <- list()

for (i in 1:length(boot35)){
  bs35[[i]] <- summary(boot35[[i]]) 
}

# Filtering significant edges
se35 <- list()

for (i in 1:length(bs35)){
  se35[[i]] <- bs35[[i]] %>%
    filter(type == "edge") %>% 
    filter(q2.5 > 0 | q97.5 < 0)
}

# Nodes names
nod35 <- list()

for (i in 1:length(se35)){
  nod35[[i]] <- sort(unique(c(se35[[i]]$node1, se35[[i]]$node2)))
}

# Adjacency matrices
am35 <- vector("list", length(se35))

# Fill matrices with 0
# squared matrices with 0
for (i in seq_along(nod35)) {
  nodos <- nod35[[i]]
  
  matriz <- matrix(0, nrow = length(nodos), ncol = length(nodos),
                   dimnames = list(nodos, nodos))
  
  am35[[i]] <- matriz
}


# Fill in adjacency matrices
for (j in seq_along(se35)) {
  enlaces <- se35[[j]]      # Extracting links data frame
  matriz <- am35[[j]]       # Extracting matrix
  
  for (i in seq_len(nrow(enlaces))) {
    from <- enlaces$node1[i]
    to <- enlaces$node2[i]
    peso <- enlaces$mean[i]
    
    if (from %in% rownames(matriz) && to %in% colnames(matriz)) {
      matriz[from, to] <- peso
      matriz[to, from] <- peso
    }
  }
  
  # Saving updated matrix
  am35[[j]] <- matriz
}

rm(from, i, j, nodos, peso, to, matriz, enlaces)

save(am35, bs35, nod35, se35, file = "dat/sigNets35.RData")

detach("package:dplyr", unload = TRUE)
rm(list=ls())
