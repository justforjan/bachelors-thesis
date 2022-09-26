library(tidyverse)
library(maps)

# read hdi and gdp data
gdp <- read.csv("D:/Daten/Bildung/HS Mannheim/BA/Data/Map/gdppercapita_us_inflation_adjusted.csv", show_col_types = FALSE)
hdi <- read.csv("D:/Daten/Bildung/HS Mannheim/BA/Data/Map/hdi_human_development_index.csv", show_col_types = FALSE)

