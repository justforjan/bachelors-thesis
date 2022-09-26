df1 <- data.frame(c("Germany", "Germany", "France", "France"), c(1950, 2020, 1950, 2020), c(1,2,3,4))
colnames(df1) <- c("country", "year", "value")

df2 <- data.frame(c("Germany", "Germany", "France", "France"), c(1950, 2020, 1950, 2020), c(10,20,30,40))
colnames(df2) <- c("country", "year", "value")


df3 <- data.frame(c("Germany", "Germany", "Belgium", "Belgium"), c(1950, 2020, 1950, 2020), c(5,6,7,8))
colnames(df3) <- c("country", "year", "value")

df4 <- data.frame(c("Germany", "Germany", "Spain"), c(1950, 2020, 1950), c(11,22,33))
colnames(df4) <- c("country", "year", "value")



list_all_data <- list(df1, df2, df3, df4)

final <- list_all_data %>% reduce(full_join, by=c("country", "year"))

df5 <- subset(df4, select = -c("country"))