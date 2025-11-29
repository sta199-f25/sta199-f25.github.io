# load packages ----------------------------------------------------------------

library(arrow)
library(tidyverse)

all_data <- read_parquet(here::here("lab/data/rdu-flights/data_0.parquet"))

# prep data --------------------------------------------------------------------

rdu_flights <- all_data |>
  filter(Origin == "RDU") |>
  janitor::clean_names() |>
  select(
    year,
    quarter,
    flight_date,
    month,
    day_of_month = dayof_month,
    day_of_week,
    carrier_code = reporting_airline,
    origin,
    origin_city = origin_city_name,
    dest,
    dest_city = dest_city_name,
    dep_time,
    dep_delay,
    dep_delay_15 = dep_del15,
    arr_time,
    arr_delay,
    arr_delay_15 = arr_del15,
    crs_elapsed_time,
    actual_elapsed_time,
    air_time,
    distance
  ) |>
  mutate(
    air_time = as.numeric(air_time)
  ) |>
  drop_na() |>
  right_join(
    nycflights13::airlines |> rename(carrier_name = name),
    join_by(carrier_code == carrier)
  ) |>
  relocate(carrier_name, .after = carrier_code)

# write data for lab 7 --------------------------------------------------------

write_csv(rdu_flights, file = "lab/data/rdu-flights.csv")

# sample and write data for lab 8 ---------------------------------------------

set.seed(20251129)
rdu_flights_sample <- rdu_flights |>
  slice_sample(n = 10) |>
  select(distance, air_time) |>
  rownames_to_column(var = "flight_id")

write_csv(rdu_flights_sample, file = "lab/data/rdu-flights-sample.csv")
