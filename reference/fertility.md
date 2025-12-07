# Fertility data

Fertility data analysed by Winkelmann(1995). The data comes from the
second (1985) wave of German Socio-Economic Panel. The sample is formed
by 1,243 women aged 44 or older in 1985. The response variable is the
number of children per woman and explanatory variables are described in
more details below.

## Usage

``` r
fertility
```

## Format

A data frame with 9 variables (5 factors, 4 integers) and 1243
observations:

- `children`:

  integer; response variable: number of children per woman (integer).

- `german`:

  factor; is the mother German? (yes or no).

- `years_school`:

  integer; education measured as years of schooling.

- `voc_train`:

  factor; vocational training ? (yes or no)

- `university`:

  factor; university education ? (yes or no)

- `religion`:

  factor; mother's religion: Catholic, Protestant, Muslim or Others
  (reference).

- `rural`:

  factor; rural (yes or no ?)

- `year_birth`:

  integer; year of birth (last 2 digits)

- `age_marriage`:

  integer; age at marriage

For further details, see Winkelmann (1995) .

## References

Winkelmann R (1995). “Duration dependence and dispersion in count-data
models.” *Journal of Business & Economic Statistics*, **13**(4),
467–474.
