library(tidyverse)
library(countrycode)

general <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/general.csv")

regions <- as.data.frame(unique(general$country))

colnames(regions) <- c("country")

regions$continent <- countrycode(sourcevar = regions$country,
                                  origin = "country.name",
                                  destination = "continent")

write_csv(regions, "regions.csv")
