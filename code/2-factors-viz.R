library(tidyverse)
library(ggplot2)


data <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_15_io_vrs_Germany.csv")

data %>%
  ggplot(aes(mean_years_in_school.x, employment_rate.x, label =  year))+
  ggplot(aes(mean_years_in_school.y, employment_rate.y, label =  year))+
  geom_point()+
  geom_text()
