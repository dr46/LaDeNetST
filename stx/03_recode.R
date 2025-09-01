# 03_recode.R
# Recoding variables

suppressPackageStartupMessages({
  library(dplyr)
})

# Loading data
rt1 <- readRDS("dat/rt1_var.rds")

# Coding variables

# Caregivers educational level
rt1$pel <- pmax(rt1$gr1, rt1$gr2, na.rm = T)
rt1$pel <- recode(rt1$pel, 
         "1" = 1, # Short
         "2" = 1,
         "3" = 1,
         "4" = 1,
         "5" = 1,
         "6" = 2, # Medium
         "7" = 2,
         "8" = 3, # Long
         "9" = 3 
)
rt1$pel <- factor(
  rt1$pel,levels = c(1, 2, 3), 
  labels = c("Short", "Medium", "Long"), 
  ordered = TRUE
)

# Caregivers mental well-being
rt1$pmw <- NA
rt1$pmw[rt1$mh1 < 4 & rt1$mh2 < 4] <- 2 # High
rt1$pmw[rt1$mh1 > 3 & rt1$mh2 > 3] <- 1 # Low
rt1$pmw[rt1$mh1 > 3 & rt1$mh2 < 4] <- 1 # Low
rt1$pmw[rt1$mh1 < 4 & rt1$mh2 > 3] <- 1 # Low

rt1$pmw <- factor(
  rt1$pmw,levels = c(1, 2), 
  labels = c("Low", "High"), 
  ordered = TRUE
)

# Birth order
rt1$bor[rt1$bor == 1] <- NA # Redundant when considering variable nch
rt1$bor <- 7 - rt1$bor

rt1$bor <- factor(
  rt1$bor,levels = c(2, 3, 4, 5), 
  labels = c("4th or greater oldest child", 
             "3rd oldest child",
             "2nd oldest child",
             "Oldest child"), 
  ordered = TRUE
)

# Sex
rt1$sex <- factor(rt1$sex, levels = c(1, 2), labels = c("Male", "Female"))

# Reading to the child
rt1$rtc <- factor(
  rt1$rtc, 
  levels = c(1, 2, 3, 4),
  labels = c("Never",
             "1-3 days",
             "4-6 days",
             "Everyday"),
  ordered = TRUE
)

# Telling stories or sing songs

rt1$ssc <- factor(
  rt1$ssc, 
  levels = c(1, 2, 3, 4),
  labels = c("Never",
             "1-3 days",
             "4-6 days",
             "Everyday"),
  ordered = TRUE
)

# Outdoor playing - weekdays
rt1$owp <- factor(
  rt1$owp, 
  levels = c(1, 2, 3, 4, 5),
  labels = c("-1 h/d",
             "1 h/d",
             "2 h/d",
             "3 h/d",
             "4|+4 h/d"),
  ordered = TRUE
)

# Outdoor playing - weekend
rt1$onp <- factor(
  rt1$onp, 
  levels = c(1, 2, 3, 4, 5),
  labels = c("-1 h/d",
             "1 h/d",
             "2 h/d",
             "3 h/d",
             "4|+4 h/d"),
  ordered = TRUE
)

# Children in household
rt1$nch <- factor(
  rt1$nch, 
  levels = c(1, 2, 3, 4),
  labels = c("1",
             "2",
             "3",
             "4+"),
  ordered = TRUE
)

# Screen time
rt1$st <- factor(
  rt1$st, 
  levels = c(1, 2, 3, 4, 5),
  labels = c("-1 h/d",
             "1 h/d",
             "2 h/d",
             "3 h/d",
             "4 | +4 h/d"),
  ordered = TRUE
)

# Parental employment
rt1$pem <- NA
rt1$pem[rt1$em1 < 3 & rt1$em2 < 3] <- 3 # Both caregivers work
rt1$pem[rt1$em1 > 2 & rt1$em2 > 2] <- 1 # No caregivers work
rt1$pem[rt1$em1 < 3 & rt1$em2 > 2] <- 2 # One caregiver works
rt1$pem[rt1$em1 > 2 & rt1$em2 < 3] <- 2 # One caregiver works

rt1$pem <- factor(
  rt1$pem,levels = c(1, 2, 3), 
  labels = c("No caregivers work", 
             "One caregiver works", 
             "Both caregivers work")
)

# Parental nativity
rt1$pan <- factor(
  rt1$pan,levels = c(1, 2, 3, 4), 
  labels = c("1st generation", 
             "2nd generation", 
             "3rd generation",
             "Other")
)

saveRDS(rt1, "dat/rt1.rds")
write.csv(rt1, "dat/rt1.csv", row.names = F)
write.csv2(rt1, "dat/rt1_2.csv", row.names = F)


detach("package:dplyr", unload = TRUE)
rm(list=ls())
.rs.restartR()
