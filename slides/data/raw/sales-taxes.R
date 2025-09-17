library(tidyverse)
library(janitor)

sales_taxes_raw <- read_csv(
  here::here(
    "slides/data/raw/2025 Sales Tax Rates  Sales Taxes by State.csv"
  )
)

sales_taxes <- sales_taxes_raw |>
  clean_names() |>
  mutate(across(where(is.character), str_remove, "%")) |>
  mutate(across(contains("tax"), as.numeric))

sales_taxes |>
  write_csv(here::here("slides/data/sales-taxes-25.csv"))
