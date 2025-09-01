# 11_Tab_desc_Nets.R
# Tables of descriptive statistics for networks

library(qgraph)
library(ggplot2)

source("fun/fc_df_to_tab.R")

load("dat/sigNets12.RData"); rm(bs12, nod12, se12)
load("dat/sigNets35.RData"); rm(bs35, nod35, se35)

# Clustering tables
# Children aged 1 to 2
ct.row12 <- list()
ct.ok12 <- list()

for (i in 1:length(am12)) {
  ct.row12[[i]] <- clusteringTable(am12[[i]], standardized = F)
  ct.ok12[[i]] <- reshape(ct.row12[[i]], 
                          idvar = "node", 
                          direction = "wide", 
                          timevar = "measure", 
                          drop = c("graph", "type"))
}

clus.table.12 <- rbind(ct.ok12[[1]], ct.ok12[[2]])
clus.table.12 <- cbind(clust = c(rep(1,nrow(ct.ok12[[1]])), rep(2,nrow(ct.ok12[[2]]))), clus.table.12)

clus.table.12 <- clus.table.12[, c(1:3,6)]

decim.clus <- c("value.WS", "value.Barrat")
clus.table.12[decim.clus] <- lapply(clus.table.12[decim.clus],
                                    function(x) round(x, 4))

# Children aged 3 to 5
ct.row35 <- list()
ct.ok35 <- list()

for (i in 1:length(am35)) {
  ct.row35[[i]] <- clusteringTable(am35[[i]], standardized = F)
  ct.ok35[[i]] <- reshape(ct.row35[[i]], 
                          idvar = "node", 
                          direction = "wide", 
                          timevar = "measure", 
                          drop = c("graph", "type"))
}

clus.table.35 <- rbind(ct.ok35[[1]], ct.ok35[[2]])
clus.table.35 <- cbind(clust = c(rep(1,nrow(ct.ok35[[1]])), rep(2,nrow(ct.ok35[[2]]))), clus.table.35)

clus.table.35 <- clus.table.35[, c(1:3,6)]

decim.clus <- c("value.WS", "value.Barrat")
clus.table.35[decim.clus] <- lapply(clus.table.35[decim.clus],
                                    function(x) round(x, 4))

# Centrality measures
# Children aged 1 to 2
cent.t.row12 <- list()
cent.t.ok12 <- list()

for (i in 1:length(am12)) {
  cent.t.row12[[i]] <- centralityTable(am12[[i]], standardized = F)
  cent.t.ok12[[i]] <- reshape(cent.t.row12[[i]], 
                              idvar = "node", 
                              direction = "wide", 
                              timevar = "measure", 
                              drop = c("graph", "type"))
}

centrality.table12 <- rbind(cent.t.ok12[[1]], cent.t.ok12[[2]])
centrality.table12 <- cbind(clust = c(rep(1,nrow(cent.t.ok12[[1]])),rep(2,nrow(cent.t.ok12[[2]]))), centrality.table12)

decim <- c("value.Betweenness", "value.Closeness", "value.Strength", "value.ExpectedInfluence")
centrality.table12[decim] <- lapply(centrality.table12[decim],
                                    function(x) round(x, 4))



# Children aged 3 to 5
cent.t.row35 <- list()
cent.t.ok35 <- list()

for (i in 1:length(am35)) {
  cent.t.row35[[i]] <- centralityTable(am35[[i]], standardized = F)
  cent.t.ok35[[i]] <- reshape(cent.t.row35[[i]], 
                              idvar = "node", 
                              direction = "wide", 
                              timevar = "measure", 
                              drop = c("graph", "type"))
}

centrality.table35 <- rbind(cent.t.ok35[[1]], cent.t.ok35[[2]])
centrality.table35 <- cbind(clust = c(rep(1,nrow(cent.t.ok35[[1]])),rep(2,nrow(cent.t.ok35[[2]]))), centrality.table35)

decim <- c("value.Betweenness", "value.Closeness", "value.Strength", "value.ExpectedInfluence")
centrality.table35[decim] <- lapply(centrality.table35[decim],
                                    function(x) round(x, 4))

#centrality.table35 <- centrality.table35[, c(1:4,6)]

# Column titles
colnames(clus.table.12) <- c("Screen time", "Node", "WS", "Barrat")
colnames(clus.table.35) <- c("Screen time", "Node", "WS", "Barrat")
colnames(centrality.table12) <- c("Screen time", "Node", "Betweenness", "Closeness", "Strength", "Expected Influence")
colnames(centrality.table35) <- c("Screen time", "Node", "Betweenness", "Closeness", "Strength", "Expected Influence")

clus.table.12$`Screen time` <- ifelse(clus.table.12$`Screen time` == 1, "Less than 1 hour per day", "More than 1 hour per day")

clus.table.35$`Screen time` <- ifelse(clus.table.35$`Screen time` == 1, "Less than 1 hour per day", "More than 1 hour per day")

centrality.table12$`Screen time` <- ifelse(centrality.table12$`Screen time` == 1, "Less than 1 hour per day", "More than 1 hour per day")

centrality.table35$`Screen time` <- ifelse(centrality.table35$`Screen time` == 1, "Less than 1 hour per day", "More than 1 hour per day")


#### saving tables

gtmd(clus.table.12, 
     tit = "Clustering table # Networks for children aged 1 to 2", 
     file = "tab/ClustTab12.md",
     sk = 2, 
     renderizar = TRUE)

gtmd(centrality.table12, 
     tit = "Centrality table # Networks for children aged 1 to 2", 
     file = "tab/CenTab12.md",
     sk = 2, 
     renderizar = TRUE)

gtmd(clus.table.35, 
     tit = "Clustering table # Networks for children aged 3 to 5", 
     file = "tab/ClustTab35.md",
     sk = 2, 
     renderizar = TRUE)

gtmd(centrality.table35, 
     tit = "Centrality table # Networks for children aged 3 to 5", 
     file = "tab/CenTab35.md",
     sk = 2, 
     renderizar = TRUE)

detach("package:qgraph", unload = TRUE)
detach("package:ggplot2", unload = TRUE)
rm(list=ls())
.rs.restartR()
