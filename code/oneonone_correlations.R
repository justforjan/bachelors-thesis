library(tidyverse)

sel <- function(a){
  a %>%
    select(dmu, efficiencies)
}



dea11 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_11.csv")
dea12 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_12.csv")
dea13 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_13.csv")
dea14 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_14.csv")
dea15 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_15.csv")
dea21 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_21.csv")
dea22 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_22.csv")
dea23 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_23.csv")
dea24 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_24.csv")
dea25 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_25.csv")
dea31 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_31.csv")
dea32 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_32.csv")
dea33 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_33.csv")
dea34 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_34.csv")
dea35 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_35.csv")
dea41 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_41.csv")
dea42 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_42.csv")
dea43 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_43.csv")
dea44 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_44.csv")
dea45 <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs_45.csv")

dea11 <- sel(dea11)
dea12 <- sel(dea12)
dea13 <- sel(dea13)
dea14 <- sel(dea14)
dea15 <- sel(dea15)
dea21 <- sel(dea21)
dea22 <- sel(dea22)
dea23 <- sel(dea23)
dea24 <- sel(dea24)
dea25 <- sel(dea25)
dea31 <- sel(dea31)
dea32 <- sel(dea32)
dea33 <- sel(dea33)
dea34 <- sel(dea34)
dea35 <- sel(dea35)
dea41 <- sel(dea41)
dea42 <- sel(dea42)
dea43 <- sel(dea43)
dea44 <- sel(dea44)
dea45 <- sel(dea45)

dea_full_vrs <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_vrs.csv")
dea_full_vrs <- sel(dea_full_vrs)

all_deas <- list(
  dea_full_vrs,
  dea11,
  dea12,
  dea13,
  dea14,
  dea15,
  dea21,
  dea22,
  dea23,
  dea24,
  dea25,
  dea31,
  dea32,
  dea33,
  dea34,
  dea35,
  dea41,
  dea42,
  dea43,
  dea44,
  dea45
)

all_deas <- reduce(all_deas, full_join, by = "dmu")

colnames(all_deas) <- as.character(c("dmu",
                                     "full_dea",
                                     11,
                                     12,
                                     13,
                                     14,
                                     15,
                                     21,
                                     22,
                                     23,
                                     24,
                                     25,
                                     31,
                                     32,
                                     33,
                                     34,
                                     35,
                                     41,
                                     42,
                                     43,
                                     44,
                                     45))

oneonone_correlations <- as.data.frame(cor(all_deas[2:ncol(all_deas)]))

write_csv(oneonone_correlations, "D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/oneonone_correlations.csv")
