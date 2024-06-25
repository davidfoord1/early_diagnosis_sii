library(readr)

full_csv_paths <- list.files("data/rcrd_full_csv", full.names = TRUE)

# We will store only staged data and requisite columns
stages <- paste0("Stage ", 1:4)

read_csv(full_csv_paths, lazy = TRUE) |>
  subset(STAGE %in% stages) |>
  subset(select = c(YEAR,
                    MONTH,
                    STAGE,
                    ICB,
                    DEPRIVATION,
                    STATISTIC,
                    TUMOUR_SITE_GROUP)) |>
  write_csv("data/rcrd_cut.csv")
