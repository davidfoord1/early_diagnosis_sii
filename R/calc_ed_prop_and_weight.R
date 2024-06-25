calc_ed_prop_and_weight <- function(df, by) {
  early_stages <- paste0("Stage ", 1:2)

  df |>
    mutate(is_early_stage = STAGE %in% early_stages) |>
    summarise(
      early_stage = sum(STATISTIC * is_early_stage),
      staged = sum(STATISTIC),
      ed_prop = early_stage / staged,
      ed_prop_var = ed_prop * (1 - ed_prop) / staged, # p * q / n
      ed_prop_weight = sqrt(1 / ed_prop_var),
      .by = all_of(by)
    )
}
