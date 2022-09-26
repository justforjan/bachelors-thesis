print('Regions not in mapdata - hdi')
not_in_mapdata_hdi <- sort(setdiff(hdi$region,unique(mapdata$region)))
print('Regions not in HDI')
not_in_hdi <- sort(setdiff(unique(mapdata$region),hdi$region))


print('Regions not in mapdata - gdp')
not_in_mapdata_gdp <- sort(setdiff(gdp$region,unique(mapdata$region)))
print('Regions not in HDI')
not_in_gdp <- sort(setdiff(unique(mapdata$region),gdp$region))


not_in_mapdata <- sort(unique(c(not_in_mapdata_hdi, not_in_mapdata_gdp)))
not_in_gdp_hdi <- sort(unique(c(not_in_hdi, not_in_gdp)))

as.data.frame(not_in_gdp_hdi, not_in_mapdata)

write_csv(as.data.frame(not_in_mapdata), 'G:/My Drive/Bildung/Hochschule/BA/Data/Map/country comparison/not_in_mapdata.csv')
write_csv(as.data.frame(not_in_gdp_hdi), 'G:/My Drive/Bildung/Hochschule/BA/Data/Map/country comparison/not_in_gdp_hdi.csv')