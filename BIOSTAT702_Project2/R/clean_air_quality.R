# Clean one year of air quality data.
# file_path: path to the CSV file.
# ozone_units: "ppm" (default) or "ppb".
# Returns one row per day with average pollutant concentrations.
process_air_quality <- function(file_path, ozone_units = "ppm") {
  data <- read.csv(file_path)
  data <- unique(data)
  names(data) <- c("date", "co", "units_co", "pm25", "units_pm25",
                   "o3", "units_o3")
  data$date <- as.Date(data$date, format = "%m/%d/%Y")

  for (p in c("co", "pm25", "o3")) {
    data[[p]][which(data[[p]] < 0)] <- 0
  }

  data <- data %>%
    group_by(date) %>%
    summarise(co = mean(co, na.rm = TRUE),
              pm25 = mean(pm25, na.rm = TRUE),
              o3 = mean(o3, na.rm = TRUE),
              .groups = "drop")

  if (ozone_units == "ppb") data$o3 <- data$o3 * 1000
  data
}