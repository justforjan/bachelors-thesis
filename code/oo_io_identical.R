oo <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_oo_crs.csv", show_col_types = FALSE)
io <- read_csv("D:/Daten/Bildung/HS Mannheim/BA/bachelors-thesis/processed_data/dea_results_113_io_crs.csv", show_col_types = FALSE)

identical(oo["dmu"], io["dmu"])
