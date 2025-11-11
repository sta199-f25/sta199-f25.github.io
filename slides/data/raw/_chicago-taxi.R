library(tidyverse)
library(janitor)
library(modeldatatoo)

data_taxi <- data_taxi() |>
  mutate(tip = as.character(tip))

set.seed(1234)
bind_rows(
  data_taxi |> filter(tip == "no"),
  data_taxi |> filter(tip == "yes") |> slice_sample(n = 2000 - 791)
) |>
  write_csv(here::here("slides/data/chicago-taxi.csv"))
