calc_sii_groups <-  function(df, by) {
  df |>
    ungroup() |>
    group_by(YEAR) |>
    mutate(eng_sii_sd = sd(sii),
           eng_sii_mean = mean(sii)) |>
    ungroup() |>
    group_by(across(all_of(by))) |>
    mutate(
      group_eng_sd_over_mean = case_when(
        sii >= eng_sii_mean + 2 * eng_sii_sd                                   ~ 1,
        sii >= eng_sii_mean + eng_sii_sd & sii < eng_sii_mean + 2 * eng_sii_sd ~ 2,
        sii >= eng_sii_mean - eng_sii_sd & sii < eng_sii_mean + eng_sii_sd     ~ 3,
        sii < eng_sii_mean - eng_sii_sd                                        ~ 4
      )
    ) |>
    mutate(
      group_icb_std_err_over_mean = case_when(
        sii >= eng_sii_mean + 2 * sii_std_err                                    ~ 1,
        sii >= eng_sii_mean + sii_std_err & sii < eng_sii_mean + 2 * sii_std_err ~ 2,
        sii >= eng_sii_mean - sii_std_err & sii < eng_sii_mean + sii_std_err     ~ 3,
        sii < eng_sii_mean - sii_std_err                                         ~ 4
      )
    )
}
