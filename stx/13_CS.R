# 13_CS.R
# Centrality stability tests

library(qgraph)
library(bootnet)
library(MASS)
library(ggplot2)
library(dplyr)
library(tidyr)
library(stringr)

source("fun/fc_CS.adj.R")
source("fun/fc_plot.CS.R")
source("fun/fc_cs.ci.R")
source("fun/fc_corStabSum.R")
source("fun/fc_df_to_tab.R")

load("dat/sigNets12.RData"); rm(bs12, nod12, se12)
load("dat/sigNets35.RData"); rm(bs35, nod35, se35)

# Step 0: Loading data --- to capture sample size
a12_c <- readRDS("dat/a12_c.rds")

# Preparing datasets 
c1.12 <- a12_c[which(a12_c$c12 == 1), c(2:12)]
c2.12 <- a12_c[which(a12_c$c12 == 2), c(2:12)]


ds.12 <- list(c1.12, c2.12)
rm(a12_c, c1.12, c2.12)

# Original sample size
ss12 <- list()

for (i in 1:length(ds.12)){
  ss12[[i]] <- nrow(ds.12[[i]])
}

rm(ds.12, i)

##************************************************************
# 
# Omitted code. See README file for details and explanations
# 
##************************************************************

# 1. Capturing files in folder
files.cs12 <- list.files(path = "dat/cs12", 
                         pattern = "^cs12_.*\\.rds$", 
                         full.names = TRUE)

# 2. Reading .rds and create a lists of lists
list.cs12 <- lapply(files.cs12, readRDS)

# 3. New list combined
cs12 <- vector("list", length = length(list.cs12[[1]]))

# 4. For each main element 
for (i in seq_along(cs12)) {
  # Init the 10-element list
  sublista <- vector("list", length = length(list.cs12[[1]][[i]]))
  
  # Corresponding 10 data.frames
  for (j in seq_along(sublista)) {
    # Extract j data.frame from i row from each file
    dfs <- lapply(list.cs12, function(x) x[[i]][[j]])
    
    # Bindig by rows
    sublista[[j]] <- do.call(rbind, dfs)
  }
  
  # Save combined sub-list in main list
  cs12[[i]] <- sublista
}

# 5. Assigning names
names(cs12) <- names(list.cs12[[1]])
for (i in seq_along(cs12)) {
  names(cs12[[i]]) <- names(list.cs12[[1]][[i]])
}

rm(sublista, list.cs12, files.cs12, i, j, dfs)

st.g <-c("Less than 1 h/d", "More than 1 h/d")

# Centrality stability plots
pdf("fig/cs12.pdf")
for (i in 1:length(cs12)){
  print(
    plot.CS(cs12[[i]], 
            tit = paste("Centrality Stability # Age 1 to 2 #", st.g[i]))
  )
}
dev.off()



# CS-coefficient **********************************************
cs12Sum <- list()

for (i in 1:length(cs12)){
  cs12Sum[[i]] <- cs.sum(cs12[[i]])
}

cs_coefs12 <- list()

for (i in 1:length(cs12Sum)){
  cs_coefs12[[i]] <- cs.ci(cs12Sum[[i]])
}

cs.coef.t12 <- matrix(NA, nrow = length(cs12Sum), ncol = 4)
rownames(cs.coef.t12) <- c("Less than 1 h/d", "More than 1 h/d")
colnames(cs.coef.t12) <- c("Strength", "Closeness", "Betweennes", "Expected Influence")

# CS-coefficients table
for (i in 1:length(cs_coefs12)){
  cs.coef.t12[i, ] <- cs_coefs12[[i]][[2]]
  #print(cs.coef.t12)
}

cs.coef.t12 <- as.data.frame(cs.coef.t12)
clusters <- rownames(cs.coef.t12)
cs.coef.t12 <- cbind(Cluster = clusters, cs.coef.t12)

gtmd(cs.coef.t12, file = "tab/CS12.md",
     tit = "Centrality Stability (CS) coefficients for children aged 1 to 2", 
     sk = 2, 
     renderizar = TRUE)


rm(cs_coefs12, ss12, am12, clusters, i)

#**** Children aged 3 to 5 ***************************

# Step 0: Loading data --- to capture sample size
a35_c <- readRDS("dat/a35_c.rds")

# Preparing datasets 
c1.35 <- a35_c[which(a35_c$c35 == 1), c(2:19)]
c2.35 <- a35_c[which(a35_c$c35 == 2), c(2:19)]

ds.35 <- list(c1.35, c2.35)
rm(a35_c, c1.35, c2.35)

# Original sample size
ss35 <- list()

for (i in 1:length(ds.35)){
  ss35[[i]] <- nrow(ds.35[[i]])
}

rm(ds.35, i)

##************************************************************
# 
# Omitted code. See README file for details and explanations
# 
##************************************************************

# 1. Capturing files in folder
files.cs35 <- list.files(path = "dat/cs35", 
                         pattern = "^cs35_.*\\.rds$", 
                         full.names = TRUE)

# 2. Reading .rds and create a lists of lists
list.cs35 <- lapply(files.cs35, readRDS)

# 3. New list combined
cs35 <- vector("list", length = length(list.cs35[[1]]))

# 4. Para cada uno de los 3 elementos principales
for (i in seq_along(cs35)) {
  # Inicializar sublista con 10 elementos
  sublista <- vector("list", length = length(list.cs35[[1]][[i]]))
  
  # Para cada uno de los 10 data.frames
  for (j in seq_along(sublista)) {
    # Extraer el j-ésimo data.frame de la i-ésima sublista de cada archivo
    dfs <- lapply(list.cs35, function(x) x[[i]][[j]])
    
    # Combinar por filas
    sublista[[j]] <- do.call(rbind, dfs)
  }
  
  # Guardar la sublista combinada en la lista principal
  cs35[[i]] <- sublista
}

# 5. Asignar nombres si los elementos originales los tenían
names(cs35) <- names(list.cs35[[1]])
for (i in seq_along(cs35)) {
  names(cs35[[i]]) <- names(list.cs35[[1]][[i]])
}

rm(sublista, list.cs35, files.cs35, i, j, dfs)

# Centrality stability plots
pdf("fig/cs35.pdf")
for (i in 1:length(cs35)){
  print(
    plot.CS(cs35[[i]], 
            tit = paste("Centrality Stability # Age 3 to 5 #", st.g[i]))
  )
}
dev.off()

# CS-coefficient **********************************************
cs35Sum <- list()

for (i in 1:length(cs35)){
  cs35Sum[[i]] <- cs.sum(cs35[[i]])
}

cs_coefs35 <- list()

for (i in 1:length(cs35Sum)){
  cs_coefs35[[i]] <- cs.ci(cs35Sum[[i]])
}

cs.coef.t35 <- matrix(NA, nrow = length(cs35Sum), ncol = 4)
rownames(cs.coef.t35) <- c("Less than 1 h/d", "More than 1 h/d")
colnames(cs.coef.t35) <- c("Strength", "Closeness", "Betweennes", "Expected Influence")

# CS-coefficients table
for (i in 1:length(cs_coefs35)){
  cs.coef.t35[i, ] <- cs_coefs35[[i]][[2]]
  #print(cs.coef.t35)
}

cs.coef.t35 <- as.data.frame(cs.coef.t35)
clusters <- rownames(cs.coef.t35)
cs.coef.t35 <- cbind(Cluster = clusters, cs.coef.t35)

gtmd(cs.coef.t35, file = "tab/CS35.md",
     tit = "Centrality Stability (CS) coefficients for children aged 3 to 5", 
     sk = 2, 
     renderizar = TRUE)

rm(cs_coefs35, ss35, am35, clusters, i, CS.adj, cs.ci, cs.sum, gtmd, plot.CS)

save(cs.coef.t12, cs.coef.t35, cs12, cs35, cs12Sum, cs35Sum, file = "dat/CS-data.RData")

detach("package:bootnet", unload = TRUE)
detach("package:qgraph", unload = TRUE)
detach("package:MASS", unload = TRUE)
detach("package:ggplot2", unload = TRUE)
detach("package:dplyr", unload = TRUE)
detach("package:tidyr", unload = TRUE)
detach("package:stringr", unload = TRUE)
rm(list=ls())
.rs.restartR()
