
#' Combine GGIR Summary Output
#'
#' This function allows you to combine multiple csv files from the GGIR
#' output, to get data from all your participants in the same dataset
#' @param filepath A filepath to the folder holding all of your output data
#' @param part The output you want to combine, i.e. 2, 4 or 5
#' @example part4 <- get_summary_parts(filepath = "Output", part = 4)


get_summary_parts <- function(filepath, part) {

  if (2 %in% part) {
    data <- list.files(path = filepath, pattern = "part2_s", recursive = T, full.names = T)
  } else if (4 %in% part) {
    data <- list.files(path = filepath, pattern = "part4_summary_sleep_c", recursive = T, full.names = T)
  } else if (5 %in% part) {
    data <- list.files(path = filepath, pattern = "part5_p", recursive = T, full.names = T)
  } else {
    print("Please supply a filepath to your data and part number, e.g. filepath = 'Data', part = 5")
  }
  read_files <- lapply(data, readr::read_csv)
  bind_files <- dplyr::bind_rows(read_files)
  out <- bind_files
  return(out)

}
