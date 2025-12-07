# Plot a frequency chart

Plot a frequency chart to compare actual and predicted values.

## Usage

``` r
frequency_plot(count_labels, actual, pred, colours = character(0))
```

## Arguments

- count_labels:

  character, labels to be used.

- actual:

  numeric, the observed probabilities for the different count specified
  in `count_labels`.

- pred:

  data.frame of predicted values. Should have the same number of rows as
  actual and one column per model. The columns' names will be used as
  labels for the different models.

- colours:

  character vector of colour codes with `length` `ncol(pred)` + 2. If
  `colours` is missing or `length(colours) < ncol(pred) + 2`, the
  remaining colours are generated using
  [`RColorBrewer::brewer.pal`](https://rdrr.io/pkg/RColorBrewer/man/ColorBrewer.html).

## Value

an object from class `"trellis"`

## Details

In order to compare actual and fitted values, a barchart plot is
created. It is the user's responsibility to provide the count, observed
and fitted values.

If argument `colour` is missing or not of sufficient length, the colours
are set automatically using a function from package RColorBrewer.

The bar chart is created with
[`lattice::barchart`](https://rdrr.io/pkg/lattice/man/xyplot.html). If
`frequency_plot` is called from the command line, the returned value is
automatically ‘printed’ (i.e., the plot is produced). Otherwise, for
example in scripts, you may need to use
[`print()`](https://rdrr.io/r/base/print.html) on the returned value.
