dmu <- c("a", "b", "c", "d", "e", "f")
a <- c(1,2,3,4,5,6)
b <- c(1,2,3,4,5,6)
c <- c(2,2,2,2,2,2)
d <- c(1,1,2,2,3,3)

# data frames
ab <- data.frame(dmu,a,b)
ac <- data.frame(dmu,a,c)
acd <- data.frame(dmu,a,c,d)

# model ab
model_data_ab <- read_data(ab, 
                        ni=1, 
                        no=1,
                        dmus = 1)

result_ab <- model_basic(model_data_ab, orientation = "io", rts="crs")

eff_ab <- efficiencies(result_ab)

ab$eff <- eff_ab


# model ac
model_data_ac <- read_data(ac, 
                           ni=1, 
                           no=1,
                           dmus = 1)

# crs
result_ac_crs <- model_basic(model_data_ac, orientation = "io", rts="crs")

eff_ac_crs <- efficiencies(result_ac_crs)

ac$eff_crs <- eff_ac_crs

# vrs
result_ac_vrs <- model_basic(model_data_ac, orientation = "io", rts="vrs")

eff_ac_vrs <- efficiencies(result_ac_vrs)

ac$eff_vrs <- eff_ac_vrs

# model acd
model_data_acd <- read_data(acd, 
                           ni=1, 
                           no=2,
                           dmus = 1)
# crs
result_acd_crs <- model_basic(model_data_acd, orientation = "io", rts="crs")

eff_acd_crs <- efficiencies(result_acd_crs)

acd$eff_crs <- eff_acd_crs

# vrs
result_acd_vrs <- model_basic(model_data_acd, orientation = "io", rts="vrs")

eff_acd_vrs <- efficiencies(result_acd_vrs)

acd$eff_vrs <- eff_acd_vrs




