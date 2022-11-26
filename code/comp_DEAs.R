# data names
name_original_vrs <- "dea_results_113_io_vrs.csv"
name_original_crs <- "dea_results_113_io_crs.csv"

name_withouth_life_expect_vrs <- "dea_results_113_io_vrs_without_life_expect.csv"
name_without_schooling_vrs <- "dea_results_113_io_vrs_without_schooling.csv"
name_withouth_life_expect_crs <- "dea_results_113_io_crs_without_life_expect.csv"
name_without_schooling_crs <- "dea_results_113_io_crs_without_schooling.csv"

name_scaled_vrs <- "dea_results_113_io_vrs_scaled.csv"
name_scaled_crs <- "dea_results_113_io_crs_scaled.csv"

# import data
original_vrs <- read_csv(paste("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/", name_original_vrs, sep = ""), show_col_types = FALSE)
original_crs <- read_csv(paste("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/", name_original_crs, sep = ""), show_col_types = FALSE)

without_life_expect_vrs <- read_csv(paste("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/", name_withouth_life_expect_vrs, sep = ""), show_col_types = FALSE)
without_schooling_vrs <- read_csv(paste("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/", name_without_schooling_vrs, sep = ""), show_col_types = FALSE)
without_life_expect_crs <- read_csv(paste("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/", name_withouth_life_expect_crs, sep = ""), show_col_types = FALSE)
without_schooling_crs <- read_csv(paste("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/", name_without_schooling_crs, sep = ""), show_col_types = FALSE)

scaled_vrs <- read_csv(paste("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/", name_scaled_vrs, sep = ""), show_col_types = FALSE)
scaled_crs <- read_csv(paste("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/", name_scaled_crs, sep = ""), show_col_types = FALSE)

# correlations
## without on output
cor(original_vrs$efficiencies, without_life_expect_vrs$efficiencies) # 0.92
cor(original_vrs$efficiencies, without_schooling_vrs$efficiencies) # 0.98

cor(original_crs$efficiencies, without_life_expect_crs$efficiencies) # 0.99
cor(original_crs$efficiencies, without_schooling_crs$efficiencies) # 0.98

## scaled
cor(original_vrs$efficiencies, scaled_vrs$efficiencies) # 1.0
cor(original_crs$efficiencies, scaled_crs$efficiencies) # 1.0

# -> same efficiencies?
identical(original_crs$efficiencies, scaled_crs$efficiencies) # TRUE


# fully efficient countries
original_vrs_100 <- original_vrs$country[original_vrs$efficiencies == 1]
original_crs_100 <- original_crs$country[original_crs$efficiencies == 1]


without_schooling_crs_100 <- without_schooling_crs$country[without_schooling_crs$efficiencies == 1]
without_schooling_vrs_100 <- without_schooling_vrs$country[without_schooling_vrs$efficiencies == 1]

without_life_expect_crs_100 <- without_life_expect_crs$country[without_life_expect_crs$efficiencies == 1]
without_life_expect_vrs_100 <- without_life_expect_vrs$country[without_life_expect_vrs$efficiencies == 1]


scaled_vrs_100 <- scaled_vrs$country[scaled_vrs$efficiencies == 1]
scaled_crs_100 <- scaled_crs$country[scaled_crs$efficiencies == 1]

## original vs missing output
setdiff(original_vrs_100, without_life_expect_vrs_100) # "Austria" "Belgium" "France"  "Israel"  "Italy"   "Japan" 
setdiff(without_life_expect_vrs_100, original_vrs_100) # ""

setdiff(original_crs_100, without_life_expect_crs_100) # ""
setdiff(without_life_expect_crs_100, original_crs_100) # ""


setdiff(original_vrs_100, without_schooling_vrs_100) # Israel"     "Kazakhstan" "Latvia" 
setdiff(without_schooling_vrs_100, original_vrs_100) # ""

setdiff(original_crs_100, without_schooling_crs_100) # "Czechia"    "Germany"    "Kazakhstan" "Latvia" 
setdiff(without_schooling_crs_100, original_crs_100) # ""






