# fc_rs.R
# Function to recode node shapes as a function of language dimension evaluation

rs <- function(x){
  rx <- recode(x, "Use" = "circle", "Form" = "triangle", "Content" = "square")
  return(rx)
}
