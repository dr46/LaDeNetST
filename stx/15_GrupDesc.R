# 15_GrupDesc.R
# Describing groups by age

library(gtsummary)
library(labelled)
library(dplyr)
library(gt)
library(rstatix)

source("fun/fc_combined_effect_size.R")

dt <- readRDS("dat/rt1.rds")
c35 <- readRDS("dat/c35.rds")
c12 <- readRDS("dat/c12.rds")

c12$c12 <- ifelse(c12$c12 == 1, "Less than 1 h/d",
                  "More than 1 h/d")
c35$c35 <- ifelse(c35$c35 == 1, "Less than 1 h/d",
                  "More than 1 h/d")

dt35 <- merge(dt, c35, by = "id", all.x = T)
dt3512 <- merge(dt35, c12, by = "id", all.x = T)
dt <- dt3512
rm(dt35, dt3512, c12, c35)


# Recoding screen time considering less than 1 hour as a threshold
dt$st1 <- ifelse(dt$st > "-1 h/d", "More than 1 h/d", "Less than 1 h/d")

# Labelling variables

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

# Table 3

t3a <- dt |> 
  tbl_summary(
    by = c12,
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

dt_12 <- dt[dt$age >= 1 & dt$age <= 2, ]

effect_sizes_12 <- map_dfr(
  vars,
  ~combined_effect_size(dt_12, variable = .x, by = "c12")
)

t3a <- t3a |>
  modify_table_body(
    ~ .x |>
      left_join(effect_sizes_12, by = "variable") |>
      mutate(effect_size = ifelse(row_type == "label", effect_size, NA))
  ) |>
  modify_header(effect_size ~ "**Effect size**")


t3b <- dt |> 
  tbl_summary(
    by = c35,
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

dt_35 <- dt[dt$age >= 3 & dt$age <= 5, ]

effect_sizes_35 <- map_dfr(
  vars,
  ~combined_effect_size(dt_35, variable = .x, by = "c35")
)

t3b <- t3b |>
  modify_table_body(
    ~ .x |>
      left_join(effect_sizes_35, by = "variable") |>
      mutate(effect_size = ifelse(row_type == "label", effect_size, NA))
  ) |>
  modify_header(effect_size ~ "**Effect size**")


t3 <- tbl_merge(
  list(t3a, t3b),
  tab_spanner = c("**Screen time for children 1 to 2**", "**Screen time for children 3 to 5**")
)

gt_t3 <- as_gt(t3)
gtsave(gt_t3, "tab/Table_3.html")
browseURL("tab/Table_3.html")


# Table 4
t4a <- dt |> 
  tbl_summary(
    by = c12,
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

effect_sizes_12 <- map_dfr(
  vars,
  ~combined_effect_size(dt_12, variable = .x, by = "c12")
)

t4a <- t4a |>
  modify_table_body(
    ~ .x |>
      left_join(effect_sizes_12, by = "variable") |>
      mutate(effect_size = ifelse(row_type == "label", effect_size, NA))
  ) |>
  modify_header(effect_size ~ "**Effect size**")

t4b <- dt |> 
  tbl_summary(
    by = c35,
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
  
effect_sizes_35 <- map_dfr(
  vars,
  ~combined_effect_size(dt_35, variable = .x, by = "c35")
)

t4b <- t4b |>
  modify_table_body(
    ~ .x |>
      left_join(effect_sizes_35, by = "variable") |>
      mutate(effect_size = ifelse(row_type == "label", effect_size, NA))
  ) |>
  modify_header(effect_size ~ "**Effect size**")

t4 <- tbl_merge(
  list(t4a, t4b),
  tab_spanner = c("**Screen time for children 1 to 2**", "**Screen time for children 3 to 5**")
)

gt_t4 <- as_gt(t4)
gtsave(gt_t4, "tab/Table_4.html")
browseURL("tab/Table_4.html")

# Table 5

t5 <- dt |> 
  tbl_summary(
    by = c35,
    percent = "column",
    include = c(owp, onp)) |>
  modify_header(label ~ "**Variable/level**")|>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Screen time for Children aged 3 to 5**") |>
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
vars <- c("owp", "onp")

effect_sizes_35 <- map_dfr(
  vars,
  ~combined_effect_size(dt_35, variable = .x, by = "c35")
)

t5 <- t5 |>
  modify_table_body(
    ~ .x |>
      left_join(effect_sizes_35, by = "variable") |>
      mutate(effect_size = ifelse(row_type == "label", effect_size, NA))
  ) |>
  modify_header(effect_size ~ "**Effect size**")
  
gt_t5 <- as_gt(t5)
gtsave(gt_t5, "tab/Table_5.html")
browseURL("tab/Table_5.html")

detach("package:gtsummary", unload = TRUE)
detach("package:labelled", unload = TRUE)
detach("package:dplyr", unload = TRUE)
detach("package:gt", unload = TRUE)
rm(list=ls())
.rs.restartR()
