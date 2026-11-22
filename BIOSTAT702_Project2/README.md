# Air Quality at RDU Airport, 2018–2020

## Purpose
This BIOSTAT 702 project cleans daily EPA air pollution measurements from the RDU airport monitoring station and describes the monthly patterns of CO, PM2.5, and ozone. It is an exploratory analysis of pollution data, not an analysis of sickle cell patient outcomes.

## Data
Original files: `data/AQ_2018.csv`, `data/AQ_2019.csv`, and `data/AQ_2020.csv`. The data contain monitoring results for 2018, 2019, and January–April 2020, respectively. Source described in the assignment: EPA air monitoring station at RDU airport, Durham County, North Carolina.

## Files
- `data/`: the three original CSV files
- `R/clean_air_quality.R`: a function to clean one year of data, average repeated daily measurements, and optionally convert ozone ppm to ppb
- `Project2_Report.Rmd`: all code for the tables, plots, and report
- `Project2_Report.docx`: prepared Word preview (Knit the Rmd in RStudio to produce the final report from R output)

## Reproduce the report
1. Open `Project2_RDU_SCD.Rproj` in RStudio.
2. Install required packages, if needed:
   `install.packages(c("rmarkdown", "knitr", "dplyr", "tidyr", "ggplot2"))`
3. Open `Project2_Report.Rmd` and click **Knit** → **Knit to Word**, or run:
   `rmarkdown::render("Project2_Report.Rmd")`
4. The Word report should be saved as `Project2_Report.docx`. The R code is hidden in the Word output.

## Author and date
Author: **[Add your name]**  
Date: **2026-11-22**

## GitHub
Create a GitHub repository, connect this local project, and make at least two meaningful commits at different points during your own work before submitting. A GitHub connection cannot be created from the supplied files alone.