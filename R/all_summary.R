
#' Combine all GGIR summary output into a single dataset
#'
#' This function combines all 'summary' parts of the GGIR output (within a
#' single results folder) into a single dataset. So part2_summary,
#' part4_summary_sleep_cleaned, and part5_personsummary will be combined by ID
#' number.
#' @param filepath A filepath to the folder containing your results
#' @example summary_data <- all_summary(filepath = "Study_Results/output_2019_test")


all_summary <- function(filepath) {
  file_list <-
    list.files(
      path = filepath,
      # listing summary files within directory
      pattern = "(part2_s|part4_summary_sleep_c|part5_p)",
      recursive = T,
      full.names = T
    )

  read_files <- lapply(file_list, readr::read_csv) # read in files

  clean_files <-
    purrr::map_if(read_files,
                  ~ "calendardate" %in% names(.x), # select calendardate from within list
                  ~ .x
                  %>% select(-calendardate)) # removing calendardate due to non-matching duplicate columns

  clean_files2 <-
    purrr::map_if(clean_files,
                  ~ "ID" %in% names(.x), # select ID within list
                  ~ .x
                  %>% dplyr::rename("id" = "ID"))  # fixing non-matching ID issue

  full <-
    purrr::reduce(clean_files2, dplyr::full_join, by = "id") # joining by id

  full$date <- as.Date(full$start_time) # Adding date
  full$time <-
    format(full$start_time, "%H:%M:%S") # And time

  return(full)
}
