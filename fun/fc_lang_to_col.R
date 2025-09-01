# fc_lang_to_col.R
# Language evaluation dimension to color

fc_lang_to_col <- function(x){
  col <- recode(
    x, 
    "Discourse" = "pink",
    "Lexicon" = "green",
    "Pragmatics" = "cyan",
    "Semantics" = "white",
    "Phonology" = "orange"
  )
  return(col)
}
