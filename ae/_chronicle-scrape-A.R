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
  html_elements(".space-y-4 .text-brand") |>
  html_text()

authors_dates_times <- page |>
  html_elements(".space-y-4 .font-semibold") |>
  html_text2() |>
  str_remove("By ")

urls <- page |>
  html_elements(".space-y-4 .font-extrabold") |>
  html_attr(name = "href")

# create a data frame ----------------------------------------------------------

chronicle_raw <- tibble(
  # var name  = vector name
  title = titles,
  author_date_time = authors_dates_times,
  column = columns,
  url = urls
)

# clean up data ----------------------------------------------------------------

chronicle <- chronicle_raw |>
  # separate author and date_time into two columns
  separate_wider_delim(
    author_date_time,
    delim = "\n|\n",
    names = c("author", "date_time"),
    too_few = "align_start"
  ) |>
  # separate column_1 and column_2 into two columns
  separate_wider_delim(
    column,
    delim = " | ",
    names = c("column_1", "column_2"),
    too_few = "align_start"
  ) |>
  mutate(
    # make column be column_2 if it exists, otherwise column_1
    column = if_else(is.na(column_2), column_1, column_2),
    # parse date_time into a date-time object
    date_time = mdy_hm(date_time),
    # extract month and day from date_time
    month = month(date_time, label = TRUE),
    day = day(date_time),
    # create full url
    url = paste0("https://www.dukechronicle.com/", url)
  ) |>
  # select only relevant columns
  select(title, author, date_time, month, day, column, url)

# write data -------------------------------------------------------------------

write_csv(chronicle, file = "data/chronicle.csv")
