# fc_df_to_tab.R
# Producing tables in .html from data.frames

gtmd <- function(df, 
                 tit = NULL, 
                 file = "table.md",
                 sk = 2, 
                 renderizar = TRUE) {
  # Empty lines before table
  espacio <- rep("", sk)
  
  # Title (optional)
  encabezado <- if (!is.null(tit)) paste0("### ", tit) else NULL
  
  # Table heading
  header <- paste0("| ", paste(names(df), collapse = " | "), " |")
  separator <- paste0("|", paste(rep("---", ncol(df)), collapse = " | "), " |")
  
  # Table rows
  rows <- apply(df, 1, function(row) paste0("| ", paste(row, collapse = " | "), " |"))
  
  # Joining all
  contenido <- c(encabezado, espacio, header, separator, rows)
  
  # Save .md file
  writeLines(contenido, file)
  message("Markdown file save as: ", file)
  
  # Renderising to HTML if desired
  if (renderizar) {
    rmarkdown::render(file, output_format = "github_document")
    message("HTML file generated.")
  }
}
