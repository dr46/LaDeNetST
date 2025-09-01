# fc_vtol.R
# Function to convert a vector to a list of positions for vector values

v.to.l <- function(z){
  cu <- unique(z)                             # Unique characters
  lp <- lapply(cu, function(x) which(z == x)) # List with positions
  names(lp) <- cu                             # Naming assignation
  return(lp[order(names(lp))])                                  # Returning list
}


#v.to.l(nf.12[[i]]$ld12)[order(names(v.to.l(nf.12[[i]]$ld12)))]