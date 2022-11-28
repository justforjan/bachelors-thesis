library(countrycode)
library(tidyverse)

data_113 <-  read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/Working Files 113/data_general.csv")
data_112 <-  read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/Working Files 112/data_general.csv")

# number of data point
nrow(data_112) # 1103
nrow(data_113) # 591

# number of continents, countries etc
table(data_112$continent)
table(data_113$continent)

length(unique(data_112$country))
length(unique(data_113$country))

countries_112 <- as.data.frame(table(data_112$country))
countries_112
countries_113 <- as.data.frame(table(data_113$country))
countries_113

subset(countries_112, Freq >= 5)
nrow(subset(countries_112, Freq >= 5))
subset(countries_113, Freq >= 5)
nrow(subset(countries_113, Freq >= 5))
subset(countries_112, Freq >= 10)
nrow(subset(countries_112, Freq >= 10))
subset(countries_113, Freq >= 10)
nrow(subset(countries_113, Freq >= 10))


countries_112$continent <- countrycode(sourcevar = countries_112$Var1,
                                          origin = "country.name",
                                          destination = "continent")

countries_113$continent <- countrycode(sourcevar = countries_113$Var1,
                                       origin = "country.name",
                                       destination = "continent")

table(countries_112$continent)
table(countries_113$continent)

table(subset(countries_112, Freq >= 5)$continent)
table(subset(countries_113, Freq >= 5)$continent)
table(subset(countries_112, Freq >= 10)$continent)
table(subset(countries_113, Freq >= 10)$continent)

nrow(subset(data_113, country %in% subset(countries_113, Freq >= 10)$Var1))


cor_data <- merge(data_112 %>% select(dmu, efficiency_crs, efficiency_vrs), data_113 %>% select(dmu, efficiency_crs, efficiency_vrs), by = "dmu", all.y = TRUE)
nrow(cor_data)
colnames(cor_data) <- c(
  "dmu",
  "eff_112_crs",
  "eff_112_vrs",
  "eff_113_crs",
  "eff_113_vrs"
)

cor(cor_data[,2:ncol(cor_data)])
