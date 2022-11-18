split_dmu <- function(data) {
  separate(data, dmu, c("country", "year"), "_", remove=FALSE)
}


merge_dmu <- function(data, rm.country_year = TRUE) {
  data$dmu <- str_c(data$country, "_", data$year)
  if (isTRUE(rm.country_year)) {
    data$country <- NULL
    data$year <- NULL
  }
  data <- data %>% relocate(dmu)
  data
}


to_long <- function(data) {
  # pivot_longer(data, !country, names_to = "year", values_to = "value")
  data %>% gather("year", "value", -country)
}


interpolate <- function(data) {
  data %>%
    group_by(country) %>%
    mutate(value = na.approx(value, na.rm = F, maxgap = 10))
}


rm.years <- function(data) {
  subset(data, year %in% min_year:max_year)
}


check0 <- function(data) {
  sum(data <= 0, na.rm = TRUE)
}


merger <- function(indicators) {
  d <- general[c("dmu", indicators)]
  d <- drop_na(d)
  d
}


merger2 <- function(indicators) {
  d <- reduce(indicators, full_join, by="dmu")
  drop_na(d)
}


write_final <- function(final) {
  write_csv(final, paste("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/", deparse(substitute(final)), ".csv", sep = ""))
}


read_final <- function(attempt) {
  read_csv(paste("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/final_", as.character(attempt), ".csv", sep = ""), show_col_types = FALSE)
}


# deepdive_input_crs <- function(a) {
#   data_verylong_input_crs %>%
#     filter(country == a)%>%
#     ggplot(aes(year, value, color=indicator))+
#     geom_line()+
#     geom_point()+
#     facet_wrap(vars(indicator), scales = "free_y", ncol = 1, strip.position = "top")+
#     theme(strip.background = element_blank(), strip.placement = "outside")
# }
# 
# deepdive_output_crs <- function(a) {
#   data_verylong_output_crs %>%
#     filter(country == a)%>%
#     ggplot(aes(year, value, color=indicator))+
#     geom_line()+
#     geom_point()+
#     facet_wrap(vars(indicator), scales = "free_y", ncol = 1, strip.position = "top")+
#     theme(strip.background = element_blank(), strip.placement = "outside")
# }

deepdive <- function(a, io) {
  if (io == "i") {
    d <- data_verylong_input
  } else {
    d <- data_verylong_output
  }
  
  d %>%
    filter(country == a)%>%
    ggplot(aes(year, value, color=indicator))+
    geom_line()+
    geom_point()+
    facet_wrap(vars(indicator), scales = "free_y", ncol = 1, strip.position = "top")+
    theme(strip.background = element_blank(), strip.placement = "outside")
}



