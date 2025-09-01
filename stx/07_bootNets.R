# 07_bootNets.R
# Bootstrapped networks 

library(bootnet)

load("dat/Nets12.RData"); rm(nf.12)
load("dat/Nets35.RData"); rm(nf.35)

# # Bootstrapping networks for children aged 1 to 2 - -  - - - 
boot12 <- list()

for (i in 1:length(nets.12)){
  boot12[[i]] <- bootnet(nets.12[[i]],
                         nBoots = 1000,
                         nCores = 3,
                         type = "nonparametric")
}

save(boot12, file = "dat/boots.12.RData")

# Bootstrapping networks for children aged 3 to 5 - -  - - - - 
boot35 <- list()

for (i in 1:length(nets.35)){
  boot35[[i]] <- bootnet(nets.35[[i]],
                         nBoots = 1000,
                         nCores = 3,
                         type = "nonparametric")
}

save(boot35, file = "dat/boots.35.RData")

detach("package:bootnet", unload = TRUE)
rm(list=ls())
.rs.restartR()
