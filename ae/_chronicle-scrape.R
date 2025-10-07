# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)
library(polite)

# check that we can scrape data from the chronicle -----------------------------

bow("https://www.dukechronicle.com/section/opinion?page=1&per_page=500")

# read page --------------------------------------------------------------------

session <- bow(
  "https://www.dukechronicle.com/section/opinion?page=1&per_page=500",
  user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36"
)

page <- scrape(session)

# parse components -------------------------------------------------------------

titles <- page |>
  html_elements(".space-y-4 .font-extrabold") |>
  html_text()

columns <- page |>
  html_elements("___") |>
  html_text()

authors_dates_times <- page |>
  ___

urls <- page |>
  ___

# create a data frame ----------------------------------------------------------

chronicle_raw <- tibble(
  # var name  = vector name
  title = titles,
  ___
)

# clean up data ----------------------------------------------------------------

chronicle <- chronicle_raw |>
  # separate author and date_time into two columns
  ___ |>
  # separate column_1 and column_2 into two columns
  ___ |>
  mutate(
    # make column be column_2 if it exists, otherwise column_1
    column = ___,
    # parse date_time into a date-time object
    date_time = ___,
    # extract month and day from date_time
    month = ___,
    day = ___,
    # create full url
    url = ___
  ) |>
  # select only relevant columns
  select(title, author, date_time, month, day, column, url)

# write data -------------------------------------------------------------------

write_csv(chronicle, file = "data/chronicle.csv")
