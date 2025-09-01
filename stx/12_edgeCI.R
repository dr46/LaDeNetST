# 12_edgeCI.R
# Confidence Intervals edge plots

library(dplyr)
library(ggplot2)
library(patchwork)

load("dat/sigNets12.RData"); rm(bs12, nod12, am12)
load("dat/sigNets35.RData"); rm(bs35, nod35, am35)

st.g <-c("Less than 1 hour per day of screen time", "More than 1 hour per day of screen time")
st.gs <-c("Less than 1 h/d", "More than 1 h/d")

pdf("fig/edgeCI_12.pdf")
for (i in seq_along(se12)) {
  # Splitting list
  df <- se12[[i]]
    # 
  df_filtrado <- df %>%
    mutate(link = paste0(node1, " - ", node2))
  
  # Plot
  print(
    ggplot(df_filtrado, aes(y = reorder(link, sample))) +
      geom_errorbarh(aes(xmin = q2.5_non0, xmax = q97.5_non0), height = 0.3, color = "gray50") +
      geom_point(aes(x = sample), color = "black", size = 3) +  # Sample
      geom_line(aes(x = sample, group = 1), color = "black", lwd = 0.8) +
      geom_point(aes(x = mean_non0), color = "red", size = 3, shape = 17) +  # Bootstrap
      
      labs(
        title = paste("Screen time:", st.g[i], "# Age 1 to 2"),
        x = "Strength",
        y = "Edge"
      ) +
      theme_minimal() +
      theme(axis.text.y = element_text(size = 10))
  )
}
dev.off()

pdf("fig/edgeCI_35.pdf")
for (i in seq_along(se35)) {
  # Splitting list
  df <- se35[[i]]
  # 
  df_filtrado <- df %>%
    mutate(link = paste0(node1, " - ", node2))
  
  # Plot
  print(
    ggplot(df_filtrado, aes(y = reorder(link, sample))) +
      geom_errorbarh(aes(xmin = q2.5_non0, xmax = q97.5_non0), height = 0.3, color = "gray50") +
      geom_point(aes(x = sample), color = "black", size = 3) +  # Sample
      geom_line(aes(x = sample, group = 1), color = "black", lwd = 0.8) +
      geom_point(aes(x = mean_non0), color = "red", size = 3, shape = 17) +  # Bootstrap
      
      labs(
        title = paste("Screen time:", st.g[i], "# Age 3 to 5"),
        x = "Strength",
        y = "Edge"
      ) +
      theme_minimal() +
      theme(axis.text.y = element_text(size = 10))
  )
}
dev.off()


# Panels

plots12 <- list()
for (i in seq_along(se12)) {
  # Splitting list
  df <- se12[[i]]
  # 
  df_filtrado <- df %>%
    mutate(link = paste0(node1, " - ", node2))
  
  # Plot
  plots12[[i]] <- ggplot(df_filtrado, aes(y = reorder(link, sample))) +
    geom_errorbarh(aes(xmin = q2.5_non0, xmax = q97.5_non0), height = 0.3, color = "gray50") +
    geom_point(aes(x = sample), color = "black", size = 3) +  # Sample
    geom_line(aes(x = sample, group = 1), color = "black", lwd = 0.8) +
    geom_point(aes(x = mean_non0), color = "red", size = 3, shape = 17) +  # Bootstrap
    
    labs(
      title = paste(st.g[i]),
      x = "Strength",
      y = "Edge"
    ) +
    theme_minimal() +
    theme(axis.text.y = element_text(size = 10))
  
}

plots35 <- list()
for (i in seq_along(se35)) {
  # Splitting list
  df <- se35[[i]]
  # 
  df_filtrado <- df %>%
    mutate(link = paste0(node1, " - ", node2))
  
  # Plot
plots35[[i]] <- ggplot(df_filtrado, aes(y = reorder(link, sample))) +
      geom_errorbarh(aes(xmin = q2.5_non0, xmax = q97.5_non0), height = 0.3, color = "gray50") +
      geom_point(aes(x = sample), color = "black", size = 3) +  # Sample
      geom_line(aes(x = sample, group = 1), color = "black", lwd = 0.8) +
      geom_point(aes(x = mean_non0), color = "red", size = 3, shape = 17) +  # Bootstrap
      
      labs(
        title = paste(st.g[i]),
        x = "Strength",
        y = "Edge"
      ) +
      theme_minimal() +
      theme(axis.text.y = element_text(size = 10))

}

# unique edges
 u12low <- data.frame(x = rep(0,4), y = c(1,3,4,8))
 u12hig <- data.frame(x = rep(0,8), y = c(1,2,4,6,7,8,12,15))
 u35low <- data.frame(x = rep(0), y = c(12))
 u35hig <- data.frame(x = rep(0, 25), y = c(1:8, 10:12, 14:16, 19:20, 24:29, 31:33))
  
l12 <- plots12[[1]] + geom_point(data = u12low, aes(x = x, y = y), shape = 60, size = 5, color = "blue")

h12 <- plots12[[2]] + geom_point(data = u12hig, aes(x = x, y = y), shape = 60, size = 5, color = "blue")

l35 <- plots35[[1]] + geom_point(data = u35low, aes(x = x, y = y), shape = 60, size = 5, color = "blue")

h35 <- plots35[[2]] + geom_point(data = u35hig, aes(x = x, y = y), shape = 60, size = 5, color = "blue")

png("fig/CI_12.png", width = 15, height = 30, units = "cm", res = 1200)
l12/h12
dev.off()

png("fig/CI_35.png", width = 15, height = 30, units = "cm", res = 1200)
l35/h35
dev.off()

detach("package:dplyr", unload = TRUE)
detach("package:ggplot2", unload = TRUE)
rm(list=ls())
