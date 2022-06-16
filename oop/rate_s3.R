rate_s3 <- function(x) {
    st <- Sys.time()
    structure(
        list(
            value = x,
            id = digest::digest(as.numeric(st) * 1000),
            timestamp = st
        ),
        class = c("RateS3", "Rate")
    )
}
numeric_rate_s3 <- function(x) {
    stopifnot(is.numeric(x) && length(x) == 1)
    res <- rate_s3(x)
    class(res) <- c("NumericRate", class(res))
    res
}
factor_rate_s3 <- function(x) {
    stopifnot(is.character(x) &&  length(x) == 1)
    res <- rate_s3(x)
    class(res) <- c("FactorRate", class(res))
    res
}