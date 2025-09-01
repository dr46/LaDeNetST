# 04_STgroups.R
# Screen time groups

## Children aged 1 to 2
a12 <- readRDS("dat/a12.rds")

rt1 <- readRDS("dat/rt1.rds")

st <- rt1[, c("id", "st")]

c12i <- merge(a12, st, by = "id")
c12i$c12 <- ifelse(c12i$st > "-1 h/d", 2, 1)
c12 <- c12i[, c("id", "c12")]


# Saving screen time groups
saveRDS(c12, "dat/c12.rds")
rm(a12, c12i)

## Children aged 3 to 5
a35 <- readRDS("dat/a35.rds")

c35i <- merge(a35, st, by = "id")
c35i$c35 <- ifelse(c35i$st > "-1 h/d", 2, 1)
c35 <- c35i[, c("id", "c35")]


saveRDS(c35, "dat/c35.rds")

rm(list=ls())
