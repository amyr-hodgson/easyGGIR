
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
  read_files <- lapply(data, read_csv)
  bind_files <- dplyr::bind_rows(read_files)
  out <- bind_files
  return(out)

}

get_daily_parts <- function(filepath, part) {

  if (2 %in% part) {
    data <- list.files(path = filepath, pattern = "part2_d", recursive = T, full.names = T)
  } else if (4 %in% part) {
    data <- list.files(path = filepath, pattern = "part4_nightsummary_sleep_c", recursive = T, full.names = T)
  } else if (5 %in% part) {
    data <- list.files(path = filepath, pattern = "part5_d", recursive = T, full.names = T)
  } else {
    print("Please supply a filepath to your data and part number, e.g. filepath = 'Data', part = 5")
  }
  read_files <- lapply(data, read_csv)
  bind_files <- dplyr::bind_rows(read_files)
  out <- bind_files
  return(out)

}
