library(ggplot2)
library(factoextra)
library(tidyverse)
library(countrycode)

# Chose the attempt
attempt = 10

# Read data
data = read_csv(paste("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/final_", as.character(attempt), ".csv", sep = ""), show_col_types = FALSE)
str(data)


# Add continent
# data$continent <- countrycode(sourcevar = data$country,
#                                   origin = "country.name",
#                                   destination = "continent")

# data <- data %>%
#   filter(year == 2000)


# data$abc <- str_c(data$continent, "_", data$country)
# data$abc <- str_c(data$country, "_", 1:dim(data))
# data$country <- NULL
# data$year <- NULL
# data$continent <- NULL
# data <- data %>% relocate(abc)

data.lables <- data$dmu

data_scale <- scale(data[2:ncol(data)])

# calculate how many clusters we nee
# Within SUm Squares
fviz_nbclust(data_scale, kmeans, method = "wss")


km.out <- kmeans(data_scale, centers = 5, nstart = 100)
print(km.out)

# Visualize the clustering algorithm results
km.clusters <- km.out$cluster
rownames(data_scale) <- data.lables
fviz_cluster(list(data=data_scale, cluster=km.clusters))
