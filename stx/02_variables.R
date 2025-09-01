# 02_variables.R
# Variables selection

nsch23 <- readRDS("dat/nsch23.rds")

# Adding "id" to identify cases
 nsch23 <- cbind(id = 1:55162, nsch23)

# T1 database
t1 <- nsch23[which(nsch23$FORMTYPE == "T1"), ]
rm(nsch23)

# Exclusion criteria
t1 <- subset(
  t1,
  (DOWNSYN != 1 | is.na(DOWNSYN)) &  # Down syndrome
    (K2Q61A != 1  | is.na(K2Q61A))  &  # Cerebral palsy 
    (K2Q60B != 1  | is.na(K2Q60B))  &  # Intellectual disability
    (K2Q37B != 1  | is.na(K2Q37B))  &  # Speech disorder
    (K2Q36B != 1  | is.na(K2Q36B))  &  # Developmental delay
    (K2Q35B != 1  | is.na(K2Q35B))  &  # Autism
    (K2Q31B != 1  | is.na(K2Q31B))     # ADAH
)

# Saving T1 database with id 
saveRDS(t1, "dat/t1.rds")

# T1 form variables variables of interest
rt1 <- t1[, c("id", # Case identification
  # Language variables
  "ASKQUESTION", "ASKQUESTION2", "CLEAREXP", "COUNTTO_R", "DIRECTIONS",
  "DIRECTIONS2", "NAMEEMOTIONS", "ONEWORD", "POINT", "RECOGBEGIN", 
  "RHYMEWORD_R","SAMESOUND","TELLSTORY", "THREEWORDS", "TWOWORDS", 
  "UNDERSTAND", "UNDERSTAND2","WAITFORTURN",
  # Additional variables
  "SCREENTIME", "SC_AGE_YEARS", "A1_GRADE", "A2_GRADE", "A1_MENTHEALTH",
  "A2_MENTHEALTH", "AGEPOS4", "SC_SEX", "K6Q60_R", "K6Q61_R", 
  "OUTDOORSWKDAY","OUTDOORSWKEND", "TOTKIDS_R", "A1_EMPLOYED_R", 
  "A2_EMPLOYED_R", "HOUSE_GEN")]

names(rt1) <- c("id", # Case identification
  # Language variables
  "ak1", "ak2", "exp", "cou", "di1", "di2","emo",
  "wo1", "poi", "rbe", "rhy","sso", "tel", "wo3", "wo2", 
  "un1", "un2",  "tur",
  # Aditional variables
  "st", "age", "gr1", "gr2", "mh1", "mh2",
  "bor", "sex", "rtc", "ssc", "owp", "onp", "nch", "em1",
  "em2", "pan")

# Deleting T1 form database
rm(t1)

# Recoding language variables

rt1$ak1 <- ifelse(rt1$ak1 == 1, 0, 1)
rt1$ak2 <- ifelse(rt1$ak2 == 1, 0, 1)
rt1$cou <- 6 - rt1$cou
rt1$di1 <- ifelse(rt1$di1 == 1, 0, 1)
rt1$di2 <- ifelse(rt1$di2 == 1, 0, 1)
rt1$wo1 <- ifelse(rt1$wo1 == 1, 0, 1)
rt1$poi <- ifelse(rt1$poi == 1, 0, 1)
rt1$rhy <- 5 - rt1$rhy
rt1$tel <- ifelse(rt1$tel == 1, 0, 1)
rt1$wo3 <- ifelse(rt1$wo3 == 1, 0, 1)
rt1$wo2 <- ifelse(rt1$wo2 == 1, 0, 1)
rt1$un1 <- ifelse(rt1$un1 == 1, 0, 1)
rt1$un2 <- ifelse(rt1$un2 == 1, 0, 1)
rt1$tur <- 6 - rt1$tur

# Language variables for children aged 1 to 2
a12 <- rt1[which(rt1$age < 3), ]

a12 <- a12[, c("id", "ak1", "ak2", 
             "di1", "di2", "wo1", "poi", 
             "tel", "wo3", "wo2", "un1",
             "un2")]

a12 <- na.omit(a12)

cases.12 <- a12$id

# Language variables for children aged 3 to 5
a35 <- rt1[which(rt1$age > 2), ]

a35 <- a35[, c("id", "ak1", "ak2", "exp", "cou", "di1", "di2","emo",
               "wo1", "poi", "rbe", "rhy","sso", "tel", "wo3", "wo2", 
               "un1", "un2",  "tur")]

a35 <- na.omit(a35)

cases.35 <- a35$id

cases <- c(cases.12, cases.35)
rt1 <- rt1[rt1$id %in% cases, ]

# Saving analysable datasets and intermediate databases
saveRDS(a12, "dat/a12.rds")
saveRDS(a35, "dat/a35.rds")
saveRDS(rt1, "dat/rt1_var.rds")
write.csv(rt1, "dat/rt1_var.csv", row.names = F)

rm(list=ls())
