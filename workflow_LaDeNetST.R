# workflow_LaDeNetST.R
# Master file

# Sample size estimations *******************************************
source("stx/01_SampleSize.R")

# Variables selection ***********************************************
source("stx/02_variables.R")
# readRDS("dat/a12.rds")
# readRDS("dat/a35.rds")
# readRDS("dat/rt1_var.rds")
# read.csv("dat/rt1_var.csv")
# readRDS("dat/t1.rds")

# Recoding variables ************************************************
source("stx/03_recode.R")
# readRDS("dat/rt1.rds")
# read.csv("dat/rt1.csv")
# read.csv2("dat/rt1_2.csv")

# Groups of children as a function of screen time *******************
source("stx/04_STgroups.R")
# readRDS("dat/c12.rds")
# readRDS("dat/c35.rds")

# Scaling language variables ****************************************
source("stx/05_tipify.R")
# readRDS("dat/a12_c.rds")
# readRDS("dat/a35_c.rds")

# Estimating networks with ******************************************
source("stx/06_PreNetEst.R")
# load("dat/Nets12.RData")
# load("dat/Nets12.RData")
# read.csv("dat/nf12.csv")
# read.csv("dat/nf35.csv")

# Bootstrapping networks ********************************************
source("stx/07_bootNets.R")
# load("dat/boots.12.RData")
# load("dat/boots.35.RData")

# Building networks including only significant edgess ***************
source("stx/08_clinNets.R")
# load("dat/sigNets12.RData")
# load("dat/sigNets35.RData")

# Plotting networks with statistically significant edges ************
source("stx/09_PlotSigNets.R")

# Figures of descriptive statistics for networks ********************
source("stx/10_Fig_desc_Nets.R")

# Tables of descriptive statistics for networks *********************
source("stx/11_Tab_desc_Nets.R")

# Confidence Intervals for significant edges in networks ************
source("stx/12_edgeCI.R")

# Centrality Stability analysis *************************************
source("stx/13_CS.R")
# load("dat/CS-data.RData")

# Describing sample *************************************************
source("stx/14_sampDesc.R")

# Group description *************************************************
source("stx/15_GrupDesc.R")






