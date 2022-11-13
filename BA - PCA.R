library(tidyverse)


filename_vrs <- "dea_results_113_io_vrs.csv"
filename_crs <- "dea_results_113_io_crs.csv"

data_vrs <- read_csv(paste("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/", filename_vrs, sep = ""), show_col_types = FALSE)
data_crs <- read_csv(paste("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/", filename_crs, sep = ""), show_col_types = FALSE)


data_general <- merge( data_crs %>% 
                         rename(efficiency_crs = efficiencies) %>% 
                         select(dmu, 
                                country, 
                                continent, 
                                year, 
                                efficiency_crs, 
                                CO2, 
                                material_footprint, 
                                foreign_investment, 
                                government_debt,
                                life_expectancy, 
                                income, 
                                mean_years_in_school, 
                                murder, 
                                income_share_20), 
                       data_vrs %>% 
                         rename(efficiency_vrs = efficiencies) %>% 
                         select(dmu, efficiency_vrs),
                       by = "dmu") %>%
  relocate(efficiency_vrs, .after = efficiency_crs)

# PCA -------
pca <- prcomp(data_general[,7:ncol(data_general)], scale = TRUE)
pca
summary(pca)
# -> die ersten 6 PCs stellen 0 Prozent dar
plot(pca, tpye = "l")
biplot(pca, scale = 0)

# EXTRACT PC SCORES ------
str(pca)
pca$x

data_general2 <- cbind(data_general, pca$x[,1:2])

# CORRELATION
cor(data_general[,7:ncol(data_general)], pca$x)
