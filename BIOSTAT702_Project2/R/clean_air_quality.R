# Process daily air quality data from one CSV file.
# file_path: path to the CSV file.
# ozone_units: "ppm" (default) or "ppb" for the ozone values.
# Returns: a data frame with one row per day and the daily mean of each pollutant.
process_air_quality <- function(file_path, ozone_units = "ppm") {
  if (!ozone_units %in% c("ppm", "ppb")) {
    stop("ozone_units must be 'ppm' or 'ppb'")
  }

  data <- read.csv(file_path, check.names = FALSE)
  data <- unique(data)
  names(data) <- c("date", "co", "units_co", "pm25", "units_pm25",
                   "o3", "units_o3")
  data$date <- as.Date(data$date, format = "%m/%d/%Y")

  for (pollutant in c("co", "pm25", "o3")) {
    data[[pollutant]][!is.na(data[[pollutant]]) &
                         data[[pollutant]] < 0] <- 0
  }

  data <- data %>%
    group_by(date) %>%
    summarise(
      co = if (all(is.na(co))) NA_real_ else mean(co, na.rm = TRUE),
      pm25 = if (all(is.na(pm25))) NA_real_ else mean(pm25, na.rm = TRUE),
      o3 = if (all(is.na(o3))) NA_real_ else mean(o3, na.rm = TRUE),
      .groups = "drop"
    )

  if (ozone_units == "ppb") {
    data$o3 <- data$o3 * 1000
  }
  return(data)
}