library(ratdat)
library(tidyverse)

complete <- left_join(left_join(surveys, species), plots) %>%
  mutate(across(where(is.factor), as.character))

set.seed(100)

# generating CSVs ---------------------------------------------------------

complete_old <- complete %>%
  filter(year < 1990)

species_new <- species %>%
  mutate(species_name = paste(genus, species)) %>%
  select(species_id, species_name, taxa)

plots_new <- plots %>%
  pivot_wider(names_from = plot_id, values_from = plot_type, names_prefix = "Plot ")

surveys_new <- surveys %>%
  filter(year >= 1990)

surveys_new <- surveys_new %>%
  slice_sample(n = 5) %>%
  bind_rows(surveys_new) %>%
  arrange(record_id)

bad_dates <- surveys_new %>%
  filter(month %in% c(4,9), day == 30) %>%
  slice_sample(n = 6) %>%
  mutate(day = day+1)

surveys_new <- surveys_new %>%
  filter(!(record_id %in% bad_dates$record_id)) %>%
  bind_rows(bad_dates) %>%
  arrange(record_id)


surveys_new$hindfoot_length[823] <- paste0(surveys_new$hindfoot_length[823], "'")

surveys_new <- surveys_new %>%
  mutate(weight = if_else(is.na(weight), 9999L, weight))

write_csv(complete_old, "data/cleaned/surveys_complete_77_89.csv")
write_csv(surveys_new, "data/raw/surveys_new.csv")
write_csv(plots_new, "data/raw/plots_new.csv")
write_csv(species_new, "data/raw/species_new.csv")


# solutions ---------------------------------------------------------------

surveys_new %>%
  filter(str_detect(hindfoot_length, pattern = "\\D"))

surveys_new %>%
  mutate(hindfoot_length = str_remove_all(hindfoot_length, "\\D"),
         hindfoot_length = as.integer(hindfoot_length),
         weight = na_if(weight, 9999))

plots_new %>%
  pivot_longer(cols = everything(), names_to = "plot_id", values_to = "plot_type") %>%
  mutate(plot_id = str_remove(plot_id, "Plot "),
         plot_id = as.integer(plot_id))

species_new %>%
  separate(species_name, into = c("genus", "species"), sep = " ")
