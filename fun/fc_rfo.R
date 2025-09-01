# fc_rfo.R
# Function to recode node fonts as a funtion of language dimension evaluation -- production / comprehension

rfo <- function(x){
  x <- recode(x, "Comprehension" = "1", "Production" = "4")
  return(as.numeric(x))
}