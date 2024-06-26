# Set up ------------------------------------------------------------------
library(readr)
library(dplyr)
library(tidyr)
library(broom)

# source all functions from the R/ folder
invisible(lapply(list.files("R", full.names = TRUE), source))

# Import ------------------------------------------------------------------
ed_tbl <- read_csv("data/rcrd_cut.csv", lazy = TRUE) |>
  filter(YEAR == "2022" | YEAR == "2023")

# Transform ---------------------------------------------------------------
ed_tbl <- ed_tbl |>
  calc_ed_prop_and_weight(by = c("YEAR", "DEPRIVATION", "ICB"))

ed_models <- ed_tbl |>
  build_ed_sii_models(by = c("YEAR", "ICB"))

ed_model_outputs <- ed_models |>
  calc_sii_change(by = "ICB") |>
  calc_sii_groups(by = c("YEAR", "ICB")) |>
  filter(YEAR == "2023") |>
  select(YEAR,
         ICB,
         sii,
         eng_sii_mean,
         group_icb_std_err_over_mean)

# Export ------------------------------------------------------------------
write_csv(ed_model_outputs, "output/ed_sii_groupings_2023.csv")
