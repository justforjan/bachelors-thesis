library(tidyverse)
library(countrycode)

general <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/general.csv")
regions <- as.data.frame(unique(separate(general, dmu, c("country", "year"), "_", remove=FALSE)$country))

colnames(regions) <- c("country")

regions <- drop_na(regions)

regions$continent <- countrycode(sourcevar = regions$country,
                                  origin = "country.name",
                                  destination = "continent")

write_csv(regions, "regions_prev.csv")
