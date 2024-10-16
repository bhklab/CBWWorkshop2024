

#' Module 2 Tutorial
#'
#' This function runs the tutorial for Module 2 using learnr.
#'
#' @export
#'
module2tutorial <- function() {
  print("Running tutorial for Module 2 using learnr")
  learnr::run_tutorial("Module2_Exercises", package = "CBWWorkshop2024")
}