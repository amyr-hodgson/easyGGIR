
#'Combine all GGIR daily output into a single dataset
#'
#' This function combines all 'daily' parts of the GGIR output (within a
#' single results folder) into a single dataset. So part2_daysummary,
#' part4_nightsummary_sleep_cleaned, and part5_daysummary will be combined by ID
#' number.
#'
#' @param filepath A filepath to the folder containing your results
#' @example daily_data <- all_daily(filepath = "Study_Results/output_2019_test")

all_daily <- function(filepath) { # this one is in 'pure tidyverse' for fun
  file_2 <-
    list.files(
      path = filepath,
      # listing daily files within directory
      pattern = "part2_d",
      recursive = T,
      full.names = T
    ) %>%
    readr::read_csv() # read in

  file_4 <-
    list.files(
      path = filepath,
      # listing daily files within directory
      pattern = "part4_nightsummary_sleep_c",
      recursive = T,
      full.names = T
    ) %>%
    readr::read_csv() %>%
    dplyr::rename("measurementday" = "night") %>% # fixing non-matching name for measurement day
    dplyr::select(-calendardate)

  file_5 <-
    list.files(
      path = filepath,
      # listing daily files within directory
      pattern = "part5_d",
      recursive = T,
      full.names = T
    ) %>%
    readr::read_csv() %>%
    dplyr::rename("measurementday" = "night_number") # fixing non-matching name for measurement day

  full_d <-
    dplyr::full_join(file_2, file_4, by = c("id", "measurementday")) %>%
    dplyr::full_join(file_5, by = c("id", "measurementday")) # join by measurment day and ID

  return(full_d)

}
