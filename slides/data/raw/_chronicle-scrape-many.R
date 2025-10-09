# load packages ---------------------------------------------------------------

library(tidyverse)
library(rvest)

# read one page ---------------------------------------------------------------

chronicle <- read_csv(here::here("slides", "data/chronicle.csv"))

article_url <- chronicle |>
  slice_head(n = 1) |>
  pull()

article_page <- read_html(article_url)

# parse article text ----------------------------------------------------------

article <- article_page |>
  html_elements(".article-content") |>
  html_text2() |>
  str_remove_all("\n")

# write function to read and parse an article page ----------------------------

parse_article_page <- function(url) {
  article_page <- read_html(url)
  article_page |>
    html_elements(".article-content") |>
    html_text2() |>
    str_remove_all("\n")
}

# add article column to chronicle data frame ----------------------------------

chronicle_article <- chronicle |>
  rowwise() |>
  mutate(article = parse_article_page(url)) |>
  ungroup()

# write data -------------------------------------------------------------------

write_csv(chronicle_article, file = "slides/data/chronicle-article.csv")
