
## Early Diagnosis SII and change in SII

Calculate the Slope Index of Inequality (SII) for the early diagnosis of
cancer by Integrated Care Board (ICB) for 2022 and 2023. First it
calculates early diagnosis proportion as incidence at stages 1 and 2 out
of all staged incidence.

For each ICB and time period, the early diagnosis proportion is fit to a
linear regression, weighted using inverse variance weighting. SII is the
gradient of the model.

``` r
source("early_diagnosis_sii.R")
#> Rows: 1066420 Columns: 7
#> ── Column specification ────────────────────────────────────────────────────
#> Delimiter: ","
#> chr (5): MONTH, STAGE, ICB, DEPRIVATION, TUMOUR_SITE_GROUP
#> dbl (2): YEAR, STATISTIC
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

``` r
ed_model_outputs |> 
  filter(YEAR == "2023")
#> # A tibble: 42 × 7
#> # Groups:   ICB [42]
#>     YEAR ICB               sii sii_std_err sii_t_stat sii_p_value sii_change
#>    <dbl> <chr>           <dbl>       <dbl>      <dbl>       <dbl>      <dbl>
#>  1  2023 NHS Herefor… -0.144        0.0353     -4.07       0.0267   -0.130  
#>  2  2023 NHS Sussex … -0.110        0.0243     -4.52       0.0202   -0.00106
#>  3  2023 NHS North E… -0.0701       0.0157     -4.47       0.0209    0.0345 
#>  4  2023 NHS Bristol… -0.0362       0.0314     -1.15       0.332     0.0537 
#>  5  2023 NHS Bedford… -0.0688       0.0202     -3.41       0.0422    0.0374 
#>  6  2023 NHS Greater… -0.0585       0.0132     -4.43       0.0214    0.0375 
#>  7  2023 NHS Shropsh… -0.0876       0.0289     -3.03       0.0563    0.0200 
#>  8  2023 NHS Cheshir… -0.0948       0.0244     -3.88       0.0303   -0.0180 
#>  9  2023 NHS Frimley… -0.0604       0.0406     -1.49       0.233     0.0238 
#> 10  2023 NHS South E…  0.00247      0.0240      0.103      0.925     0.101  
#> # ℹ 32 more rows
```
