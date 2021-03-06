rate_collector_s3 <- function() {
    structure(
        list(
            rates = list()
        ),
        class = c("RateCollectorS3", "RateCollector")
    )
}
numeric_rate_collector_s3 <- function() {
    res <- rate_collector_s3()
    class(res) <- c("NumericRateCollector", class(res))
    res
}
factor_rate_collector_s3 <- function() {
    res <- rate_collector_s3()
    class(res) <- c("FactorRateCollector", class(res))
    res
}

# methods
get_value.RateCollectorS3 <- function(x) {
    sapply(x$rates, get_value)
}