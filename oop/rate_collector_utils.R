# S3 methods for convinience
## add_rate
add_rate <- function(x, r) {
    UseMethod("add_rate")
}
setGeneric("add_rate")
add_rate.RateCollectorS3 <- function(x, r) {
    x$rates <- c(x$rates, list(r))
    x
}
add_rate.RateCollectorS4 <- function(x, r) {
    x@rates <- c(x@rates, list(r))
    x
}
setMethod("add_rate", "RateCollectorS4", function(x, r) {
    UseMethod("add_rate")
})
add_rate.RateCollectorR6 <- function(x, r) {
    x$add_rate(r)
}

## get_value
### method for S3 already defined - skipping
get_value.RateCollectorS4 <- function(x) {
    sapply(x@rates, get_value)
}
get_value.RateCollectorR6 <- function(x) {
    x$get_value()
}

## summary
summary.NumericRateCollector <- function(x) {
    summary(get_value(x))
}
summary.FactorRateCollector <- function(x) {
    table(get_value(x))
}