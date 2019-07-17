
#' Combine GGIR Daily Output
#'
#' This function allows you to combine multiple csv files from the GGIR
#' output, to get data from all your participants in the same dataset
#' @param filepath A filepath to the folder holding all of your output data
#' @param part The output you want to combine, i.e. 2, 4 or 5
#' @example part4 <- get_daily_parts(filepath = "Output", part = 4)


get_daily_parts <- function(filepath, part) {

  if (2 %in% part) { # This part lists the files according to the number selected
    data <- list.files(path = filepath, pattern = "part2_d", recursive = T, full.names = T)
  } else if (4 %in% part) {
    data <- list.files(path = filepath, pattern = "part4_nightsummary_sleep_c", recursive = T, full.names = T)
  } else if (5 %in% part) {
    data <- list.files(path = filepath, pattern = "part5_d", recursive = T, full.names = T)
  } else {
    print("Please supply a filepath to your data and part number, e.g. filepath = 'Data', part = 5")
  }
  read_files <- lapply(data, readr::read_csv) # The listed files are then read with read_csv()
  bind_files <- dplyr::bind_rows(read_files) # The files are combined into a single dataset
  out <- bind_files
  return(out)

}
