library(tidyverse)
library(lterdatasampler)

temps <- ntl_airtemp |>
  group_by(year) |>
  summarize(annual_avg_temp = mean(ave_air_temp_adjusted))

icecover <- ntl_icecover |>
  left_join(temps, by = "year") |>
  filter(!is.na(annual_avg_temp))

write_csv(icecover, "ae/data/icecover.csv")
