source("./rate_collector_s3.R")
source("./rate_collector_s4.R")
source("./rate_collector_r6.R")

source("./rate_collector_utils.R")

new_numeric_rate_collector <- function(type = c("S3", "S4", "R6")) {
    match.arg(type)
    if (type == "S3") {
        numeric_rate_collector_s3()
    } else if (type == "S4") {
        new("NumericRateCollector")
    } else if (type == "R6") {
        numeric_rate_collector_r6$new()
    }
}
new_factor_rate_collector <- function(type = c("S3", "S4", "R6")) {
    match.arg(type)
    if (type == "S3") {
        factor_rate_collector_s3()
    } else if (type == "S4") {
        new("FactorRateCollector")
    } else if (type == "R6") {
        factor_rate_collector_r6$new()
    }
}
