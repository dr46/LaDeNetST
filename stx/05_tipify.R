# 05_tipify.R
# Data standardisation

library(dplyr)

dt <- readRDS("dat/rt1.rds")

vt <- c("ak1", "ak2", "exp", "cou", "di1", "di2", "emo", "wo1", 
        "poi", "rbe", "rhy", "sso", "tel", "wo3", "wo2", "un1", "un2", 
        "tur")

dt <- dt %>%
  group_by(sex, age, pel) %>%
  mutate(across(all_of(vt), ~ (.-mean(., na.rm = TRUE))/sd(., na.rm = TRUE))) %>%
  ungroup()

a12v <- c("ak1", "ak2", "di1", "di2", "wo1", 
          "poi", "tel", "wo3", "wo2", "un1",
          "un2")

#a35v <- c("exp", "cou", "emo", "rbe", "rhy","sso", "tur")

# Saving data for network estimation
a12 <- dt[,c("id", a12v)]
c12 <- readRDS("dat/c12.rds")
a12.c <- merge(a12, c12, by = "id")
saveRDS(a12.c, "dat/a12_c.rds")

a35 <- dt[,c(1:19)]
c35 <- readRDS("dat/c35.rds")
a35.c <- merge(a35, c35, by = "id")
saveRDS(a35.c, "dat/a35_c.rds")

detach("package:dplyr", unload = TRUE)
rm(list=ls())
.rs.restartR()
