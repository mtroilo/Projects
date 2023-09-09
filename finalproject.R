library(tidyverse)
library(lubridate)
library(janitor)
library(stringr)

weedprices_cleaned <- weedprices %>%
  separate(Month, into = c("month", "year"), sep = " ") %>%
  mutate(HighQ = as.numeric(str_remove_all(HighQ, "\\$"))) %>%
  mutate(MedQ = as.numeric(str_remove_all(MedQ, "\\$"))) %>%
  mutate(LowQ = as.numeric(str_remove_all(LowQ, "\\$"))) %>%
  mutate(month = str_replace_all(month, "Jan.", "January")) %>%
  mutate(month = str_replace_all(month, "Feb.", "Febuary")) %>%
  mutate(month = str_replace_all(month, "Mar.", "March")) %>%
  mutate(month = str_replace_all(month, "Apr.", "April")) %>%
  mutate(month = str_replace_all(month, "May.", "May")) %>%
  mutate(month = str_replace_all(month, "Jun.", "June")) %>%
  mutate(month = str_replace_all(month, "Jul.", "July")) %>%
  mutate(month = str_replace_all(month, "Aug.", "August")) %>%
  mutate(month = str_replace_all(month, "Sep.", "September")) %>%
  mutate(month = str_replace_all(month, "Oct.", "October")) %>%
  mutate(month = str_replace_all(month, "Nov.", "November")) %>%
  mutate(month = str_replace_all(month, "Dec.", "December")) %>%
  janitor::clean_names()