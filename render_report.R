#!/usr/bin/env Rscript

# Render project.Rmd from a terminal, including installations where Pandoc is
# bundled with Positron but is not on the shell PATH.

args <- commandArgs(trailingOnly = FALSE)
file_arg <- grep("^--file=", args, value = TRUE)
script_dir <- if (length(file_arg) == 1) {
  dirname(normalizePath(sub("^--file=", "", file_arg)))
} else {
  getwd()
}
setwd(script_dir)

if (!requireNamespace("rmarkdown", quietly = TRUE)) {
  stop("The R package 'rmarkdown' is required. Install it with install.packages('rmarkdown').")
}

if (!rmarkdown::pandoc_available()) {
  pandoc_candidates <- c(
    "/Applications/Positron.app/Contents/Resources/app/quarto/bin/tools/aarch64/pandoc",
    "/Applications/Positron.app/Contents/Resources/app/quarto/bin/tools/x86_64/pandoc",
    "/Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools/pandoc",
    "/Applications/RStudio.app/Contents/MacOS/pandoc/pandoc"
  )
  pandoc_candidates <- pandoc_candidates[file.exists(pandoc_candidates)]

  if (length(pandoc_candidates) == 0) {
    stop(
      paste(
        "Pandoc was not found.",
        "Render from RStudio/Positron or install Pandoc and place it on PATH."
      )
    )
  }

  Sys.setenv(RSTUDIO_PANDOC = dirname(pandoc_candidates[[1]]))
}

dir.create("docs", showWarnings = FALSE)

output <- rmarkdown::render(
  input = "project.Rmd",
  output_file = "index.html",
  output_dir = "docs",
  quiet = FALSE
)

message("Report created: ", normalizePath(output))
