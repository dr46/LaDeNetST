# 06_PreNetEst.R
# Networks estimation

library(bootnet)
library(qgraph)
library(dplyr)

# Additional functions
source("fun/fc_rfo.R")
source("fun/fc_rs.R")
source("fun/fc_vtol.R")

tema <- "Borkulo"
opt <- "EBICglasso"
cortip <- "cor_auto"

# Loading data
a12_c <- readRDS("dat/a12_c.rds")

# Preparing datasets 
c1.12 <- a12_c[which(a12_c$c12 == 1), c(2:12)]
c2.12 <- a12_c[which(a12_c$c12 == 2), c(2:12)]

ds.12 <- list(c1.12, c2.12)
rm(a12_c, c1.12, c2.12)


# Node features data - - - - - 
# Node labels
nl12 <- colnames(ds.12[[1]])
# Comprehension (1)/Production (4)
cp12 <- c("Production", "Production", "Comprehension", "Comprehension", 
          "Production", "Comprehension", "Production", "Production",
          "Production", "Comprehension", "Comprehension")

# Use, form and content
ufc12 <- c("Use", "Use", "Use", "Use", "Form", "Content", "Use", "Form", 
           "Form", "Content", "Content")
# Assessment dimensions of language
ld12 <- c("Lexicon", "Lexicon", "Pragmatics", "Pragmatics", "Discourse", 
          "Lexicon", "Discourse", "Discourse", "Discourse", "Semantics", 
          "Semantics")

nf12 <- data.frame(nl12, cp12, ufc12, ld12)
write.csv(nf12, "dat/nf12.csv")
nf.12 <- list(nf12, nf12, nf12)
rm(nl12, cp12, ufc12, ld12, nf12)

# Network estimation for children aged 1 to 2
nets.12 <- list()

for (i in 1:length(ds.12)) {
  nets.12[[i]] <- estimateNetwork(ds.12[[i]], default = opt,
                                  corMethod = cortip
  )
}

st.g <-c("Less than 1 hour per day", "More than 1 hour per day")

# Ploting networks 1 to 2
pdf("fig/g12.pdf", width = 7*length(ds.12))
par(mfrow = c(1, length(ds.12)))
for(i in 1:length(nets.12)) {
  qgraph(nets.12[[i]]$graph,
         label.cex = 1.2,
         title.cex = 1.5,
         theme = tema,
         layout = "spring",
         groups = v.to.l(nf.12[[i]]$ld12),
         color = c("pink", "green", "cyan", "white"),
         # palette = "rainbow",
         shape = rs(nf.12[[i]]$ufc12),
         label.font = rfo(nf.12[[i]]$cp12),
         legend = F, # ll[i],
         # GLratio = gl[i],
         title = paste("Screen time:", st.g[i], "# Age 1 to 2")
  )
}
par(mfrow = c(1, 1))
dev.off()

save(nets.12, nf.12, file = "dat/Nets12.RData")


# -END of Networks for children aged 1 to 2- - - - - - - 

# Networks for children aged 3 to 5 
# Loading data
a35_c <- readRDS("dat/a35_c.rds")

# Preparing datasets 
c1.35 <- a35_c[which(a35_c$c35 == 1), c(2:19)]
c2.35 <- a35_c[which(a35_c$c35 == 2), c(2:19)]

ds.35 <- list(c1.35, c2.35)
rm(a35_c, c1.35, c2.35)

# Node features data - - - - - 
# Node labels
nl35 <- colnames(ds.35[[1]])
# Comprehension (1)/Production (4)
cp35 <- c("Production", "Production", "Production", "Production",
          "Comprehension", "Comprehension", "Production", "Production",
          "Comprehension", "Comprehension", "Production", "Production",
          "Production", "Production", "Production", "Comprehension",
          "Comprehension", "Comprehension")

# Use, form and content
ufc35 <- c("Use", "Use", "Use", "Content", "Use", "Use", "Content",
           "Form", "Content", "Form", "Form", "Form", "Use", "Form",
           "Form", "Content", "Content", "Use")

# Assessment dimensions of language
ld35 <- c("Lexicon", "Lexicon", "Discourse", "Lexicon", "Pragmatics",
          "Pragmatics", "Lexicon", "Discourse", "Lexicon", "Phonology",
          "Phonology", "Phonology", "Discourse", "Discourse", "Discourse",
          "Semantics", "Semantics", "Pragmatics")


nf35 <- data.frame(nl35, cp35, ufc35, ld35)
write.csv(nf35, "dat/nf35.csv")
nf.35 <- list(nf35, nf35, nf35)
rm(nl35, cp35, ufc35, ld35, nf35)

# Estimating networks children 3 to 5
nets.35 <- list()

for (i in 1:length(ds.35)) {
  nets.35[[i]] <- estimateNetwork(ds.35[[i]], default = opt,
                                  corMethod = cortip
  )
}

col35 <- list(c("pink", "green", "orange", "cyan", "white"),
              c("pink", "green", "orange", "cyan", "white"),
              c("pink", "green", "orange", "cyan", "white"))

# Ploting networks 3 to 5
pdf("fig/g35.pdf", width = 7* length(ds.35))
par(mfrow = c(1, length(ds.35)))
for(i in 1:length(nets.35)) {
  qgraph(nets.35[[i]]$graph,
         label.cex = 1.2,
         title.cex = 1.5,
         theme = tema,
         layout = "spring",
         groups = v.to.l(nf.35[[i]]$ld35),
         color = col35[[i]],
         # palette = "rainbow",
         labels = nf.35[[i]]$nl35,
         shape = rs(nf.35[[i]]$ufc35),
         label.font = rfo(nf.35[[i]]$cp35),
         legend = F, ##### For single graphs
         # GLratio = gl[i],
         title = paste("Screen time:", st.g[i], "# Age 3 to 5")
  )
}
par(mfrow = c(1, 1))
dev.off()

save(nets.35, nf.35, file = "dat/Nets35.RData")
rm(ds.35, i)


#### Plotting all networks together 

pdf("fig/all.pdf", width = 7*length(nets.12), height = 7*2)
par(mfrow = c(2, length(nets.12)))
for(i in 1:length(nets.12)) {
  qgraph(nets.12[[i]]$graph,
         label.cex = 1.2,
         title.cex = 1.5,
         theme = tema,
         layout = "spring",
         groups = v.to.l(nf.12[[i]]$ld12),
         color = c("pink", "green", "cyan", "white"),
         # palette = "rainbow",
         shape = rs(nf.12[[i]]$ufc12),
         label.font = rfo(nf.12[[i]]$cp12),
         legend = F, # ll[i],
         # GLratio = gl[i],
         title = paste("Screen time:", st.g[i], "# Age 1 to 2")
  )
}
for(i in 1:length(nets.35)) {
  qgraph(nets.35[[i]]$graph,
         label.cex = 1.2,
         title.cex = 1.5,
         theme = tema,
         layout = "spring",
         groups = v.to.l(nf.35[[i]]$ld35),
         color = col35[[i]],
         # palette = "rainbow",
         labels = nf.35[[i]]$nl35,
         shape = rs(nf.35[[i]]$ufc35),
         label.font = rfo(nf.35[[i]]$cp35),
         legend = F, ##### For single graphs
         # GLratio = gl[i],
         title = paste("Screen time:", st.g[i], "# Age 3 to 5")
  )
}
par(mfrow = c(1, 1))
dev.off()

detach("package:bootnet", unload = TRUE)
detach("package:qgraph", unload = TRUE)
detach("package:dplyr", unload = TRUE)
rm(list=ls())
.rs.restartR()

