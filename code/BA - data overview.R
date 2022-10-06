

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
foreign_investment <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/foreign_investment.csv",show_col_types = FALSE)

women_in_parliament <- separate(women_in_parliament, dmu, c("country", "year"), "_", remove=FALSE)
basic_sanitation <- separate(basic_sanitation, dmu, c("country", "year"), "_", remove=FALSE)
basic_water_source <- separate(basic_water_source, dmu, c("country", "year"), "_", remove=FALSE)
electricity <- separate(electricity, dmu, c("country", "year"), "_", remove=FALSE)
employment_rate <- separate(employment_rate, dmu, c("country", "year"), "_", remove=FALSE)
material_footprint <- separate(material_footprint, dmu, c("country", "year"), "_", remove=FALSE)
forest_area <- separate(forest_area, dmu, c("country", "year"), "_", remove=FALSE)
mean_years_in_school <- separate(mean_years_in_school, dmu, c("country", "year"), "_", remove=FALSE)
air_pollution <- separate(air_pollution, dmu, c("country", "year"), "_", remove=FALSE)
health_worker <- separate(health_worker, dmu, c("country", "year"), "_", remove=FALSE)
red_list <- separate(red_list, dmu, c("country", "year"), "_", remove=FALSE)
poverty <- separate(poverty, dmu, c("country", "year"), "_", remove=FALSE)
life_expectancy <- separate(life_expectancy, dmu, c("country", "year"), "_", remove=FALSE)
income <- separate(income, dmu, c("country", "year"), "_", remove=FALSE)
income_share_20 <- separate(data, dmu, c("country", "year"), "_", remove=FALSE)
CO2 <- separate(CO2, dmu, c("country", "year"), "_", remove=FALSE)
murder <- separate(murder, dmu, c("country", "year"), "_", remove=FALSE)
foreign_investment <- separate(foreign_investment, dmu, c("country", "year"), "_", remove=FALSE)



titles <- c(
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
"murder",
"foreign_investment"
)

earliest <- c(
min(women_in_parliament$year),
min(basic_sanitation$year),
min(basic_water_source$year),
min(electricity$year),
min(employment_rate$year),
min(material_footprint$year),
min(forest_area$year),
min(mean_years_in_school$year),
min(health_worker$year),
min(air_pollution$year),
min(red_list$year),
min(poverty$year),
min(life_expectancy$year),
min(income$year),
min(income_share_20$year),
min(CO2$year),
min(murder$year),
min(foreign_investment$year)
)

latest <- c(
max(women_in_parliament$year),
max(basic_sanitation$year),
max(basic_water_source$year),
max(electricity$year),
max(employment_rate$year),
max(material_footprint$year),
max(forest_area$year),
max(mean_years_in_school$year),
max(health_worker$year),
max(air_pollution$year),
max(red_list$year),
max(poverty$year),
max(life_expectancy$year),
max(income$year),
max(income_share_20$year),
max(CO2$year),
max(murder$year),
max(foreign_investment$year)
)

datapoints <- c(
nrow(women_in_parliament),
nrow(basic_sanitation),
nrow(basic_water_source),
nrow(electricity),
nrow(employment_rate),
nrow(material_footprint),
nrow(forest_area),
nrow(mean_years_in_school),
nrow(air_pollution),
nrow(health_worker),
nrow(red_list),
nrow(poverty),
nrow(life_expectancy),
nrow(income),
nrow(income_share_20),
nrow(CO2),
nrow(murder),
nrow(foreign_investment)
)

dps_1990_2020 <- c(
nrow(subset(women_in_parliament, year %in% c(1990:2020))),
nrow(subset(basic_sanitation, year %in% c(1990:2020))),
nrow(subset(basic_water_source, year %in% c(1990:2020))),
nrow(subset(electricity, year %in% c(1990:2020))),
nrow(subset(employment_rate, year %in% c(1990:2020))),
nrow(subset(material_footprint, year %in% c(1990:2020))),
nrow(subset(forest_area, year %in% c(1990:2020))),
nrow(subset(mean_years_in_school, year %in% c(1990:2020))),
nrow(subset(air_pollution, year %in% c(1990:2020))),
nrow(subset(health_worker, year %in% c(1990:2020))),
nrow(subset(red_list, year %in% c(1990:2020))),
nrow(subset(poverty, year %in% c(1990:2020))),
nrow(subset(life_expectancy, year %in% c(1990:2020))),
nrow(subset(income, year %in% c(1990:2020))),
nrow(subset(income_share_20, year %in% c(1990:2020))),
nrow(subset(CO2, year %in% c(1990:2020))),
nrow(subset(murder, year %in% c(1990:2020))),
nrow(subset(foreign_investment, year %in% c(1990:2020)))
)


zero_or_below <- c(
(min(women_in_parliament$value, na.rm = TRUE) <= 0),
(min(basic_sanitation$value, na.rm = TRUE) <= 0),
(min(basic_water_source$value, na.rm = TRUE) <= 0),
(min(electricity$value, na.rm = TRUE) <= 0),
(min(employment_rate$value, na.rm = TRUE) <= 0),
(min(material_footprint$value, na.rm = TRUE) <= 0),
(min(forest_area$value, na.rm = TRUE) <= 0),
(min(mean_years_in_school$value, na.rm = TRUE) <= 0),
(min(air_pollution$value, na.rm = TRUE) <= 0),
(min(health_worker$value, na.rm = TRUE) <= 0),
(min(red_list$value, na.rm = TRUE) <= 0),
(min(poverty$value, na.rm = TRUE) <= 0),
(min(life_expectancy$value, na.rm = TRUE) <= 0),
(min(income$value, na.rm = TRUE) <= 0),
(min(income_share_20$value, na.rm = TRUE) <= 0),
(min(CO2$value, na.rm = TRUE) <= 0),
(min(murder$value, na.rm = TRUE) <= 0),
(min(foreign_investment$value, na.rm = TRUE) <= 0)
)

dp_per_year <- datapoints / (latest - earliest)

overview <- data.frame(titles, earliest, latest, dps_1990_2020, datapoints, dp_per_year, zero_or_below)
overview[order(overview$dps_1990_2020, decreasing = TRUE),]

write_csv(overview, "D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/overview.csv")