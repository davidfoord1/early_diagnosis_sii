calc_sii_change <- function(df, by) {
  df |>
    ungroup() |>
    arrange(YEAR) |>
    group_by(ICB) |>
    mutate(sii_change = estimate - lag(estimate)) |>
    select(YEAR,
           ICB,
           sii = estimate,
           sii_std_err = std.error,
           sii_t_stat = statistic,
           sii_p_value = p.value,
           sii_change)
}

