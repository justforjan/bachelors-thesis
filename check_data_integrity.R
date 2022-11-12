library(tidyverse)
library(ggplot2)

whr <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/world_happiness_report.csv", show_col_types = FALSE)
colnames(whr)[2] <- "value"
life_expectancy <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/life_expectancy.csv", show_col_types = FALSE)
material_footprint <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/material_footprint.csv", show_col_types = FALSE)
hpi <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/hpi.csv", show_col_types = FALSE)
hdi <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/hdi.csv", show_col_types = FALSE)

# HPI

# merge data

data <- merge(merge(merge(
  whr, life_expectancy, by = "dmu", all = TRUE), 
  material_footprint, by = "dmu", all = TRUE), 
  hpi, by = "dmu", all = TRUE)

colnames(data)[2:ncol(data)] <- c("whr", "life_expectancy", "material_footprint", "hpi")


# Calculation of ecological footprint

# hpi = (life_expectancy * well_being)/ecologcial footprint
# ecological_footprint = (life_expectancy * well_being)/hpi

data$ecol_footprint_der <- (data$life_expectancy * data$whr) / data$hpi

# Correlation with material footprint
cor(data[c("ecol_footprint_der", "material_footprint")], use = "pairwise.complete.obs")

data %>%
  ggplot(aes(material_footprint, ecol_footprint_der))+
  geom_point()


# HDI

# hdi = ()




