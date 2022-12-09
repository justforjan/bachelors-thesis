library(tidyverse)
# library(maps)

source("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/code/functions.R")


# read data
gdp <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/income.csv", show_col_types = FALSE)
hdi <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/hdi.csv", show_col_types = FALSE)
hpi <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/raw_data/preprocessed_data/hpi.csv", show_col_types = FALSE)

gdp <- split_dmu(gdp)
hdi <- split_dmu(hdi)
hpi <- split_dmu(hpi)

# check latest year per country
latest_gdp <- gdp %>%
  group_by(country) %>%
  summarise(year = max(year),value=last(value)) # all 2020

latest_hdi <- hdi %>%
        group_by(country) %>%
        summarise(year = max(year),value=last(value)) # all 2019

latest_hpi <- hpi %>%
        group_by(country) %>%
        summarise(year = max(year),value=last(value)) # 2019 and 2020

# load mapdata
# mapdata <- map_data("world")
# 
# # check differences in naming conventions
# 
# # setdiff(mapdata$region, latest_gdp$country)
# # setdiff(latest_gdp$country, mapdata$region)
# # 
# # setdiff(mapdata$region, latest_hdi$country)
# # setdiff(latest_hdi$country, mapdata$region)
# # 
# # setdiff(mapdata$region, latest_hpi$country)
# # setdiff(latest_hpi$country, mapdata$region)
# 
# 
# nc <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/code/naming_conventions_mapdata.csv", show_col_types = FALSE)
# 
# for (country in 1:nrow(nc)) {
#   mapdata[mapdata == as.character(nc[country,1])] <- as.character(nc[country,2])
# }
# 
# write_csv(mapdata, "mapdata.csv")

mapdata <- read_csv("mapdata.csv")

# merge mapdata with values
colnames(latest_gdp)[1] <- "region"
colnames(latest_hdi)[1] <- "region"
colnames(latest_hpi)[1] <- "region"

# mapdata <- merge(mapdata, latest_gdp[c("region", "value")], by = "region")
# colnames(mapdata)[ncol(mapdata)] <- "gdp"
# 
# mapdata <- merge(mapdata, latest_hdi[c("region", "value")], by = "region")
# colnames(mapdata)[ncol(mapdata)] <- "hdi"
# 
# mapdata <- merge(mapdata, latest_hpi[c("region", "value")], by = "region")
# colnames(mapdata)[ncol(mapdata)] <- "hpi"


mapdata <- left_join(mapdata, latest_gdp[c("region", "value")], by = "region")
colnames(mapdata)[ncol(mapdata)] <- "gdp"
mapdata <- left_join(mapdata, latest_hdi[c("region", "value")], by = "region")
colnames(mapdata)[ncol(mapdata)] <- "hdi"
mapdata <- left_join(mapdata, latest_hpi[c("region", "value")], by = "region")
colnames(mapdata)[ncol(mapdata)] <- "hpi"



mapdata_gdp <- mapdata %>% filter(!is.na(gdp)) %>% select(-hdi, -hpi)

mapdata_hdi <- mapdata %>% filter(!is.na(hdi)) %>% select(-gdp, -hpi)

mapdata_hpi <- mapdata %>% filter(!is.na(hpi)) %>% select(-gdp, -hdi)


mapdata_gdp %>%
  ggplot(aes(long, lat, group=group))+
  geom_polygon(aes(fill=gdp), color = "black")

breaks_gdp <-c(0.500, 1.000, 2.000, 5.000, 10.000, 20.000, 50.000, 100.000)
colors <- c("#FFFFD9", "#EDF8B1", "#C7E9B4", "#7FCDBB", "#41B6C4", "#1D91C0", "#225EA8", "#0C2C84")

# GDP
mapdata %>%
  ggplot(aes(long, lat, group = group))+
  geom_polygon(aes(fill=gdp),color="white")+
  scale_fill_stepsn(name = "GDP in 1000", 
                   colors = c("#FFFFD9", "#EDF8B1", "#C7E9B4", "#7FCDBB", "#41B6C4", "#1D91C0", "#225EA8", "#0C2C84"),
                   breaks = breaks_gdp,
                  trans = "log2",
                  guide = "legend",
                  na.value="grey"
                    )+
  theme(
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.text=element_blank(), 
        axis.ticks=element_blank(),
        axis.title = element_blank(),
        legend.position="bottom",
        legend.spacing.x = unit(0, 'cm'),
        legend.key.width=unit(2,"cm"),
        legend.key.height = unit(0.4, "cm"),
        legend.text.align = 1,
        legend.margin=margin(t=-25))+
  guides(fill = guide_legend(label.position = "bottom", nrow=1))+
  labs(title = "GDP per capita", subtitle="Gross domestic product per person in 2020 adjusted for differences in purchasing power (in international dollars, \nfixed 2017 prices, PPP based on 2017 ICP)")

breaks_hdi <-c(0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0)

# HDI
mapdata %>%
  ggplot(aes(long, lat, group = group))+
  geom_polygon(aes(fill=hdi),color="white")+
  scale_fill_stepsn(name = "HDI", 
                    colors = c("#FFFFD9", "#EDF8B1", "#C7E9B4", "#7FCDBB", "#41B6C4", "#1D91C0", "#225EA8", "#0C2C84"),
                    breaks_hdi = c(0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0),
                    n.breaks = 8,
                    guide = "legend",
                    na.value="grey"
  )+
  theme(
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.text=element_blank(), 
    axis.ticks=element_blank(),
    axis.title = element_blank(),
    legend.position="bottom",
    legend.spacing.x = unit(0, 'cm'),
    legend.key.width=unit(2,"cm"),
    legend.key.height = unit(0.4, "cm"),
    legend.text.align = 1,
    legend.margin=margin(t=-25))+
  guides(fill = guide_legend(label.position = "bottom", nrow=1))+
  labs(title = "HDI", subtitle="2019")







