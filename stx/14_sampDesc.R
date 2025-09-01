# 14_sampDesc.R
# Sample descriptive statistics

library(gtsummary)
library(labelled)
library(dplyr)
library(gt)
library(rstatix)
library(tibble)
library(purrr)


source("fun/fc_combined_effect_size.R")

dt <- readRDS("dat/rt1.rds")

# Recoding screen time considering less than 1 hour as a threshold
dt$st1 <- ifelse(dt$st > "-1 h/d", "More than 1 h/d", "Less than 1 h/d")

# Labeling variables

dt.labs <- c(
  age = "Age",
  sex = "Sex",
  bor = "Birth order",
  pem = "Caregivers' employment status",
  rtc = "Reading to the child (past week)",
  nch = "Number of children in household",
  pan = "Parental nativity",
  owp = "Playing outdoors (weekdays)",
  onp = "Playing outdoors (weekend)",
  ssc = "Tell stories/ sing to child (past week)",
  st  = "Screen time (weekdays)",
  st1 = "Screen time (weekdays)",
  pel = "Caregivers' educational level",
  pmw = "Caregivers' mental wellbeing"
  
)
for (var in names(dt.labs)) {
  var_label(dt[[var]]) <- dt.labs[[var]]
}

# Table 1a
t1a <- dt |> 
  tbl_summary(
    include = c(age, sex, bor, nch, pel, pem),
    type = list(age ~ "continuous"),
    statistic = list(
      all_continuous() ~ "{mean} ({sd})",  
      all_categorical() ~ "{n} ({p}%)"     
    )            
  )|>
  modify_header(label ~ "**Variable/level**")

# Table 1b
t1b <- dt |> 
  tbl_summary(
    by = st1,
    include = c(age, sex, bor, nch, pel, pem),
    percent = "column",
    type = list(age ~ "continuous"),
    statistic = list(
      all_continuous() ~ "{mean} ({sd})",  
      all_categorical() ~ "{n} ({p}%)"     
    )            
  )|>
  modify_header(label ~ "**Variable/level**")|>
  modify_footnote_header("Mean (SD); n (% by column)", columns = all_stat_cols()) |>
  add_p(
    test = list(
      age ~ "t.test",
      all_categorical() ~ "chisq.test"
    )
  ) |>
  modify_header(
    statistic ~ "**Statistic**",
    parameter ~ "**df**"  # grados de libertad
  ) |>
  modify_fmt_fun(
    c(statistic, parameter) ~ style_sigfig
  ) |>
modify_fmt_fun(
  statistic ~ function(x) sprintf("%.2f", x),
  parameter ~ function(x) sprintf("%.0f", x)  # grados de libertad sin decimales
)


# Lista de variables incluidas
vars <- c("age", "sex", "bor", "nch", "pel", "pem")

# Calcular tamaño del efecto para cada variable
effect_sizes <- map_dfr(
  vars,
  ~combined_effect_size(dt, variable = .x, by = "st1")
)


t1b <- t1b |>
  modify_table_body(
    ~ .x |>
      left_join(effect_sizes, by = "variable") |>
      mutate(effect_size = ifelse(row_type == "label", effect_size, NA))
  ) |>
  modify_header(effect_size ~ "**Effect size**")

t1 <- tbl_merge(
  list(t1a, t1b),
  tab_spanner = c("**Study sample**", "**Screen time (weekdays)**")
)

gt_t1 <- as_gt(t1)
gtsave(gt_t1, "tab/Table_1.html")
browseURL("tab/Table_1.html")

# Table 2a
t2a <- dt |> 
  tbl_summary(
    include = c(pmw, pan, rtc, ssc)) |>
  modify_header(label ~ "**Variable/level**")

# Table 2b
t2b <- dt |> 
  tbl_summary(
    by = st1,
    percent = "column",
    include = c(pmw, pan, rtc, ssc)) |>
  modify_header(label ~ "**Variable/level**")|>
  modify_footnote_header("Mean (SD); n (% by column)", columns = all_stat_cols()) |>
  add_p(
    test = list(
      all_categorical() ~ "chisq.test"
    )
  ) |>
  modify_header(
    statistic ~ "**Statistic**",
    parameter ~ "**df**"  # grados de libertad
  ) |>
  modify_fmt_fun(
    c(statistic, parameter) ~ style_sigfig
  ) |>
  modify_fmt_fun(
    statistic ~ function(x) sprintf("%.2f", x),
    parameter ~ function(x) sprintf("%.0f", x)  # grados de libertad sin decimales
  )

# Lista de variables incluidas
vars <- c("pmw", "pan", "rtc", "ssc") 

# Calcular tamaño del efecto para cada variable
effect_sizes <- map_dfr(
  vars,
  ~combined_effect_size(dt, variable = .x, by = "st1")
)

t2b <- t2b |>
  modify_table_body(
    ~ .x |>
      left_join(effect_sizes, by = "variable") |>
      mutate(effect_size = ifelse(row_type == "label", effect_size, NA))
  ) |>
  modify_header(effect_size ~ "**Effect size**")


t2 <- tbl_merge(
  list(t2a, t2b),
  tab_spanner = c("**Study sample**", "**Screen time (weekdays)**")
)

gt_t2 <- as_gt(t2)
gtsave(gt_t2, "tab/Table_2.html")
browseURL("tab/Table_2.html")

detach("package:gtsummary", unload = TRUE)
detach("package:labelled", unload = TRUE)
detach("package:dplyr", unload = TRUE)
detach("package:gt", unload = TRUE)
detach("package:rstatix", unload = TRUE)
rm(list=ls())
.rs.restartR()
