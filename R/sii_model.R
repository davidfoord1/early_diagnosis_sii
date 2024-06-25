sii_model <- function(df) {
  lm(ed_prop ~ sii_x, data = df, weights = ed_prop_weight)
}
