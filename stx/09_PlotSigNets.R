# 09_PlotSigNets.R
# Plotting nets with significant edges.

library(dplyr)
library(igraph)

load("dat/sigNets12.RData"); rm(bs12, se12, nod12)
load("dat/sigNets35.RData"); rm(bs35, se35)
nf12 <- read.csv("dat/nf12.csv")
nf35 <- read.csv("dat/nf35.csv")

source("fun/fc_lang_to_col.R")
source("fun/fc_rs.R")
source("fun/fc_rfo.R")
source("fun/fc_triangle.R")

# Producing graphs [...] ---- Children aged 1 - 2
nets12 <- list()

for (i in 1:length(am12)){
  nets12[[i]] <- graph_from_adjacency_matrix(am12[[i]], mode = "undirected", weighted = TRUE)
}

# Node features
nf12 <- nf12[order(nf12$nl12), ]
nf.12 <- list(nf12, nf12, nf12)
rm(nf12)

# Node color
for (i in 1:length(nets12)){
  V(nets12[[i]])$color <- fc_lang_to_col(nf.12[[i]]$ld12)
}

# Node shape
for (i in 1:length(nets12)){
V(nets12[[i]])$shape <- rs(nf.12[[i]]$ufc12)
}

# Font shape
for (i in 1:length(nets12)){
  V(nets12[[i]])$label.font <- rfo(nf.12[[i]]$cp12)
}

# Font family
for (i in 1:length(nets12)){
  V(nets12[[i]])$label.family <- "sans"
}

# Font color
for (i in 1:length(nets12)){
  V(nets12[[i]])$label.color = "black"
}

# Edge weights
for (i in 1:length(nets12)){
  E(nets12[[i]])$width <- abs(E(nets12[[i]])$weight) * 20
}

# Edge color

for (i in 1:length(nets12)){
  E(nets12[[i]])$color <- ifelse(E(nets12[[i]])$weight > 0, "black", "red")
}

st.g <-c("Less than 1 hour per day", "More than 1 hour per day")

semilla12 <- list(a = 15, b = 2)

pdf("fig/Bg12.pdf", width = 7*length(nets12))
par(mfrow = c(1, length(nets12)))
for (i in 1:length(nets12)){set.seed(semilla12[[i]])
  plot(
    nets12[[i]],
    vertex.size = 20,
    vertex.label.cex = 1,
    main = paste("Screen time:", st.g[i], "# Age 1 to 2")
  )
}
par(mfrow = c(1, 1))
dev.off()

# Producing graphs [...] ---- Chidren aged 3 - 5
nets35 <- list()

for (i in 1:length(am35)){
  nets35[[i]] <- graph_from_adjacency_matrix(am35[[i]], mode = "undirected", weighted = TRUE)
}

# Node features
nf35 <- nf35[order(nf35$nl35), ]
nf.35 <- list(nf35, nf35, nf35)
rm(nf35)

col35 <- list()

for (i in 1:length(nets35)){
  col35[[i]] <- nf.35[[i]]$ld35[nf.35[[i]]$nl35 %in% nod35[[i]]]
}

# Node color
for (i in 1:length(nets35)){
  V(nets35[[i]])$color <- fc_lang_to_col(col35[[i]])
}

# nf.35[[i]]$ld35[nf.35[[i]]$nl35 %in% nod35[[i]]]


# Node shape
for (i in 1:length(nets35)){
  V(nets35[[i]])$shape <- rs(nf.35[[i]]$ufc35[nf.35[[i]]$nl35 %in% nod35[[i]]])
}

#nf.35[[i]]$ufc35[nf.35[[i]]$nl35 %in% nod35[[i]]]


# Font shape
for (i in 1:length(nets35)){
  V(nets35[[i]])$label.font <- rfo(nf.35[[i]]$cp35[nf.35[[i]]$nl35 %in% nod35[[i]]])
}

# Font color
for (i in 1:length(nets35)){
  V(nets35[[i]])$label.color = "black"
}


# Font family
for (i in 1:length(nets35)){
  V(nets35[[i]])$label.family <- "sans"
}

# Edge weights
for (i in 1:length(nets35)){
  E(nets35[[i]])$width <- abs(E(nets35[[i]])$weight) * 20
}

# Edge color

for (i in 1:length(nets35)){
  E(nets35[[i]])$color <- ifelse(E(nets35[[i]])$weight > 0, "black", "red")
}

semilla35 <- list(a = 2, b = 5)

pdf("fig/Bg35.pdf", width = 7*length(nets35))
par(mfrow = c(1, length(nets35)))
for (i in 1:length(nets35)){set.seed(semilla35[[i]])
  plot(
    nets35[[i]],
    vertex.size = 20,
    vertex.label.cex = 1,
    main = paste("Screen time:", st.g[i], "# Age 3 to 5")
  )
}
par(mfrow = c(1, 1))
dev.off()




####################################################################



pdf("fig/Bg.all.pdf", width = 7*length(nets12), height = 7*2)
par(mfrow = c(2, length(nets12)))
for (i in 1:length(nets12)){set.seed(semilla12[[i]])
  plot(
    nets12[[i]],
    vertex.size = 20,
    vertex.label.cex = 1.5,
    main = paste("Screen time:", st.g[i], "# Age 1 to 2")
  )
}

for (i in 1:length(nets35)){set.seed(semilla35[[i]])
  plot(
    nets35[[i]],
    vertex.size = 20,
    vertex.label.cex = 1.5,
    main = paste("Screen time:", st.g[i], "# Age 3 to 5")
  )
}
par(mfrow = c(1, 1))
dev.off()

##############################################################*

# Figure for the article
# For review

# Edge weights
for (i in 1:length(nets12)){
  E(nets12[[i]])$width <- abs(E(nets12[[i]])$weight) * 15
}

# Edge weights 35
for (i in 1:length(nets35)){
  E(nets35[[i]])$width <- abs(E(nets35[[i]])$weight) * 15
}

st.short <-c("Screen Time < 1 hr/day", "Screen Time > 1 hr/day")


png("fig/nets.png", width = 15, height = 15, units = "cm", res = 1200)
par(mfrow = c(2, length(nets12)))
par(mar = c(2, 0, 1, 0))
par(oma = c(1, 0, 0, 0)) 
for (i in 1:length(nets12)){set.seed(semilla12[[i]])
  plot(
    nets12[[i]],
    vertex.size = 22,
    vertex.label.cex = 0.7
  )
  title(main = paste(st.short[i], ", 1-2 Years", sep = ""), cex.main = 0.85)
}

for (i in 1:length(nets35)){set.seed(semilla35[[i]])
  plot(
    nets35[[i]],
    vertex.size = 22,
    vertex.label.cex = 0.7
  )
  title(main = paste(st.short[i], ", 3-5 Years", sep = ""), cex.main = 0.85)
}


# Drawing outside pannels
par(xpd = NA)

# Adding legend


legend(x = -1.3, y = -1.3,      # Coord relative to dev
       legend = c("Discourse", "Lexicon", "Pragmatics", "Semantics", "Phonology"), pch = rep(23,5),
       pt.bg = c("pink", "green", "cyan", "white", "orange"),
       col = "black",
       pt.cex = 2,
       horiz = TRUE, bty = "n", xjust = 0.5, cex = 0.9,
       text.width = strwidth("Pragmatics") * 1.2, adj = 0.01)
       


par(mfrow = c(1, 1))
dev.off()

detach("package:dplyr", unload = TRUE)
detach("package:igraph", unload = TRUE)
rm(list=ls())
