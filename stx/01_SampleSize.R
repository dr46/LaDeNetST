# 01_SampleSize.R
# Sample size estimation

library(powerly)

# Estimating sample size for children aged 1 to 2
set.seed(26)
tm.l3 <- generate_model(
  type = "ggm",
  nodes = 11,
  density = .3
)

set.seed(26)
out.l3 <- powerly(
  range_lower = 350,
  range_upper = 1000,
  samples = 100,
  replications = 40,
  measure = "sen",
  statistic = "power",
  measure_value = .8,
  statistic_value = .8,
  model = "ggm",
  model_matrix = tm.l3,
  cores = 3,
  verbose = TRUE
)

# Estimating sample size for children aged 3 to 5
set.seed(26)
tm.h3 <- generate_model(
  type = "ggm",
  nodes = 18,
  density = .25
)

set.seed(26)
out.h3 <- powerly(
  range_lower = 500,
  range_upper = 1500,
  samples = 100,
  replications = 40,
  measure = "sen",
  statistic = "power",
  measure_value = .8,
  statistic_value = .8,
  model = "ggm",
  model_matrix = tm.h3,
  cores = 3,
  verbose = TRUE
)

# Plotting results
pdf("fig/sampleSize.pdf",width = 15, height = 12)
plot(out.l3, cex =3)
plot(out.h3, cex =3)
dev.off()

detach("package:powerly", unload = TRUE)
rm(list=ls())
.rs.restartR()
