build_ed_sii_models <- function(df, by) {
  sii_x <- c(0.9, 0.7, 0.5, 0.3, 0.1)

  df |>
    arrange(DEPRIVATION) |>
    group_by(across(all_of(by))) |>
    mutate(sii_x = c(0.9, 0.7, 0.5, 0.3, 0.1)) |>
    nest() |>

    # Apply model and extract coefficients
    mutate(
      mod    = lapply(data, sii_model),
      coeffs = lapply(mod, broom::tidy)
    ) |>
    unnest(coeffs) |>

    # filter out intercept, keep gradient
    filter(term == "sii_x")
}

