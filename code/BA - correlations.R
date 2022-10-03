
library(tidyverse)

women_in_parliament <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/women_in_parliament.csv",show_col_types = FALSE)
basic_sanitation <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/basic_sanitation.csv",show_col_types = FALSE)
basic_water_source <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/basic_water_source.csv",show_col_types = FALSE)
electricity <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/electricity.csv",show_col_types = FALSE)
employment_rate <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/employment_rate.csv",show_col_types = FALSE)
material_footprint <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/material_footprint.csv",show_col_types = FALSE)
forest_area <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/forest_area.csv",show_col_types = FALSE)
mean_years_in_school <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/mean_years_in_school.csv",show_col_types = FALSE)
air_pollution <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/air_pollution.csv",show_col_types = FALSE)
health_worker <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/health_worker.csv",show_col_types = FALSE)
red_list <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/red_list.csv",show_col_types = FALSE)
poverty <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/poverty.csv",show_col_types = FALSE)
life_expectancy <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/life_expectancy.csv",show_col_types = FALSE)
income <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/income.csv",show_col_types = FALSE)
income_share_20 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/income_share_20.csv",show_col_types = FALSE)
CO2 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/CO2.csv",show_col_types = FALSE)
murder <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/murder.csv",show_col_types = FALSE)


# Create list of all data frames
all_data <- list(
  women_in_parliament,
  basic_sanitation,
  basic_water_source,
  electricity,
  employment_rate,
  material_footprint,
  forest_area,
  mean_years_in_school,
  health_worker,
  air_pollution,
  red_list,
  poverty,
  life_expectancy,
  income,
  income_share_20,
  CO2,
  murder
)

# Merge all data frame together by the country attribute
data <- all_data %>% reduce(full_join, by="dmu")


# Change column names to something meaningful
colnames(data) <- c(
  "dmu",
  "women_in_parliament",
  "basic_sanitation",
  "basic_water_source",
  "electricity",
  "employment_rate",
  "material_footprint",
  "forest_area",
  "mean_years_in_school",
  "air_pollution",
  "health_worker",
  "red_list",
  "poverty",
  "life_expectancy",
  "income",
  "income_share_20",
  "CO2",
  "murder"
)

# Calculate correlations
correlations <- as.data.frame(cor(data[2:length(data)], use = "pairwise.complete.obs"))

# Export as csv
write_csv(correlations, "D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/correlations.csv")

