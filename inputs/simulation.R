


#### Workspace setup ####
install.packages("tidyverse")
install.packages("babynames")
library(tidyverse)
library(babynames)
library(dplyr)


#### Data Simulation ####
set.seed(100)

simulated_dataset <-
  tibble(
    prime_minister = babynames |>
      filter(prop > 0.01) |>
      distinct(name) |>
      unlist() |>
      sample(size = 10, replace = FALSE),
    birth_year = sample(1820:1990, size = 10, replace = TRUE),
    years_lived = sample(50:100, size = 10, replace = TRUE),
    death_year = birth_year + years_lived
  ) |>
  select(prime_minister, birth_year, death_year, years_lived) |>
  arrange(birth_year)

simulated_dataset

#### Tests ####
# Checking if the generated names are in the babynames library. 
# This might not work for the actual dataset.
simulated_dataset$prime_minister |>
  unique() %in% babynames$name
# Making sure that the birth years are after 1820
simulated_dataset$birth_year |>
  min() >= 1820
# Making sure that the years lived are in the range provided
simulated_dataset$years_lived |>
  min() >= 50
simulated_dataset$years_lived |>
  max() <= 100

