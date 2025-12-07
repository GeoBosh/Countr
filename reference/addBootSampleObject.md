# Create a bootsrap sample for coefficient estimates

Create a boostrap sample from coefficient estimates.

## Usage

``` r
addBootSampleObject(object, ...)
```

## Arguments

- object:

  an object to add boot object to.

- ...:

  extra parameters to be passed to the
  [`boot::boot()`](https://rdrr.io/pkg/boot/man/boot.html) function
  other than `data` and `statistic`.

## Value

`object` with additional component `"boot"`

## Details

The information in `object` is used to prepare the arguments and then
`boot` is called to generate the bootstrap sample. The bootstrap sample
is stored in `object` as component `"boot"`. Arguments in `"..."` can be
used customise the `boot()` call.

## See also

[`renewal_methods`](https://geobosh.github.io/Countr/reference/renewal_methods.md)

## Examples

``` r
## see renewal_methods
```
