# 10_Fig_desc_Nets.R
# Figures of descriptive statistics for networks

library(qgraph)
library(ggplot2)
library(patchwork)

load("dat/sigNets12.RData"); rm(bs12, nod12, se12)
load("dat/sigNets35.RData"); rm(bs35, nod35, se35)

# Centrality plots
# Centrality plot storage
# Children aged 1 to 2
cp12 <- list()

for (i in 1:length(am12)) {
  cp12[[i]] <- centralityPlot(am12[[i]], scale = "z-scores", 
                              include = c("Closeness", 
                                          "Betweenness", 
                                          "ExpectedInfluence"), 
                              orderBy = "ExpectedInfluence")
}



# Children aged 3 to 5
cp35 <- list()

for (i in 1:length(am35)) {
  cp35[[i]] <- centralityPlot(am35[[i]], scale = "z-scores", 
                              include = c("Closeness", 
                                          "Betweenness", 
                                          "ExpectedInfluence"), 
                              orderBy = "ExpectedInfluence")
}

st.g <-c("Less than 1 hour per day", "More than 1 hour per day")

# Centrality plots
# Children aged 1 to 2
pdf("fig/cp12.pdf")
for (i in 1:length(cp12)) {
  print(
    cp12[[i]] + ggtitle(
      paste("Screen time:", st.g[i], "# Age 1 to 2")
    )
  )
}
dev.off()

# Joining all 1 to 2 centrality plots

cp12.all <- centralityPlot(am12, 
                           include = "all", 
                           scale = "z-scores", 
                           orderBy = "ExpectedInfluence")

pdf("fig/cp12_all.pdf", width = 9)
print(
  cp12.all + 
    labs(title = "Centrality statistics # Children aged 1 to 2", 
         x = "z-scores",
         color = "Screen time") +
    scale_color_discrete(
      labels = c("type 1" = "Less than 1 hour per day", 
                 "type 2" = "More than 1 hour per day")  
    ) 
)
dev.off()

# Children aged 3 to 5
pdf("fig/cp35.pdf")
for (i in 1:length(cp35)) {
  print(
    cp35[[i]] + ggtitle(
      paste("Screen time:", st.g[i], " # Children aged 3 and 5")
    )
  )
}
dev.off()


# Joining all 3 to 5 centrality plots

cp35.all <- centralityPlot(am35, 
                           include = c("Closeness", 
                                       "Betweenness", 
                                       "ExpectedInfluence"), 
                           scale = "raw", 
                           orderBy = "ExpectedInfluence")

pdf("fig/cp35_all.pdf", width = 9)
print(
  cp35.all + 
    labs(title = "Centrality statistics # Children aged 3 to 5", 
         x = "z-scores",
         color = "Screen time") +
    scale_color_discrete(
      labels = c("type 1" = "Less than 1 hour per day", 
                 "type 2" = "More than 1 hour per day")  
    ) 
)
dev.off()


# Clustering plots
# Age 1 to 2
clp.12 <- list()

for (i in 1:length(am12)){
  clp.12[[i]] <- clusteringPlot(am12[[i]], 
                                scale = "raw", 
                                decreasing = F,
                                include = c("Barrat"),
                                orderBy = "Barrat") 
}

pdf("fig/clp12.pdf")
for (i in 1:length(clp.12)){
  print(
    clp.12[[i]] + ggtitle(
      paste(
        "Clustering coefficients # Screen time:", st.g[i],"# Aged 1 to 2"
      )
    )
  )
}
dev.off()


# Joining clustering plots for children aged 1 to 2

clp12.all <- clusteringPlot(am12, 
                           include = c("Barrat"), 
                           scale = "raw", 
                           orderBy = "Barrat")


pdf("fig/clp12_all.pdf")
print(
  clp12.all + 
    labs(title = "Clustering plots # Children aged 1 to 2", 
         x = "Scores",
         color = "Screen time") +
    scale_color_discrete(
      labels = c("type 1" = "Less than one hour per day", 
                 "type 2" = "More than one hour per day")  
    ) 
)
dev.off()


rm(i)

# Age 3 to 5
clp.35 <- list()

for (i in 1:length(am35)){
  clp.35[[i]] <- clusteringPlot(am35[[i]], 
                                scale = "raw", 
                                decreasing = F,
                                include = c( "Barrat"),
                                orderBy = "Barrat") 
}

pdf("fig/clp35.pdf")
for (i in 1:length(clp.35)){
  print(
    clp.35[[i]] + ggtitle(
      paste(
        "Clustering coefficients # Screen time:", st.g[i],"# Aged 3 to 5"
      )
    )
  )
}
dev.off()

# Joining clustering plots for children aged 1 to 2

clp35.all <- clusteringPlot(am35, 
                            include = c("Barrat"), 
                            scale = "raw", 
                            orderBy = "Barrat")


pdf("fig/clp35_all.pdf")
print(
  clp35.all + 
    labs(title = "Clustering plots # Children aged 3 to 5", 
         x = "Scores",
         color = "Screen time") +
    scale_color_discrete(
      labels = c("type 1" = "Less than 1 hour per day", 
                 "type 2" = "More than 1 hour per day")  
    ) 
)
dev.off()

# Panels --- Based on computations provided in file 16_narrative.R
cl.12.low.a <- c(2, 3, 9, 11)
cl.12.low.b <- c(4, 5, 8, 10)

bar12.low <- clp.12[[1]] + 
  theme(strip.text = element_blank()) +
  annotate("text", x = 0.4, y = cl.12.low.a, label = "A", size = 3, col = "red") +
  annotate("text", x = 0.4, y = cl.12.low.b, label = "B", size = 3, col = "green4") +
  labs(title = "Screen Time < 1 hr/day, 1-2 Years") 

cl.12.hig.a <- c(2,3,5,11)
cl.12.hig.b <- c(1, 3, 10)
cl.12.hig.c <- c(1, 4, 6, 7, 9)

bar12.hig <- clp.12[[2]] + 
  theme(strip.text = element_blank()) +
  annotate("text", x = 0.4 +0.05, y = cl.12.hig.a, label = "A", size = 3, col = "red") +
  annotate("text", x = 0.42 +0.05, y = cl.12.hig.b, label = "B", size = 3, col = "green4") +
  annotate("text", x = 0.4+0.05, y = cl.12.hig.c, label = "C", size = 3, col = "blue") +
  labs(title = "Screen Time > 1 hr/day, 1-2 Years") 


cl.35.low.a <- c(9, 11, 12)
cl.35.low.b <- c(7, 8, 10)

bar35.low <- clp.35[[1]] + 
  theme(strip.text = element_blank()) +
  annotate("text", x = - 0.05, y = cl.35.low.a, label = "A", size = 3, col = "red") +
  annotate("text", x = -0.05, y = cl.12.hig.b, label = "B", size = 3, col = "green4")+
  labs(title = "Screen Time < 1 hr/day, 3-5 Years")

cl.35.hig.a <- c(17,15,7)
cl.35.hig.b <- c(17,14,7)
cl.35.hig.c <- c(16, 8, 4)
cl.35.hig.d <- c(16, 8, 5)
cl.35.hig.e <- c(15, 7, 3)
cl.35.hig.f <- c(17, 14, 7)
cl.35.hig.g <- c(14, 13, 9, 7, 3)

bar35.hig <- clp.35[[2]] + 
  theme(strip.text = element_blank()) +
  annotate("text", x = - 0, y = cl.35.hig.a, label = "A", size = 3, col = "red") +
  annotate("text", x = 0+0.02, y = cl.35.hig.b, label = "B", size = 3, col = "green4") +
  annotate("text", x = 0, y = cl.35.hig.c, label = "C", size = 3, col = "blue") +
  annotate("text", x = 0+0.02, y = cl.35.hig.d, label = "D", size = 3, col = "grey50") +
  annotate("text", x = 0+0.04, y = cl.35.hig.e, label = "E", size = 3, col = "black") +
  annotate("text", x = 0+0.06, y = cl.35.hig.e, label = "F", size = 3, col = "violetred") +
  annotate("text", x = 0+0.08, y = cl.35.hig.e, label = "G", size = 3, col = "olivedrab4") +
  labs(title = "Screen Time > 1 hr/day, 3-5 Years")

png("fig/barrat.png", width = 20, height = 20, units = "cm", res = 600)
(bar12.low + bar12.hig) / (bar35.low + bar35.hig)
dev.off()

detach("package:qgraph", unload = TRUE)
detach("package:ggplot2", unload = TRUE)
rm(list=ls())
.rs.restartR()
