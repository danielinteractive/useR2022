source("./rate_s3.R")
source("./rate_s4.R")
source("./rate_r6.R")

source("./rate_utils.R")

new_rate <- function(x, type = c("S3", "S4", "R6")) {
    match.arg(type)
    if (type == "S3") {
        UseMethod("new_rate_s3")
    } else if (type == "S4") {
        UseMethod("new_rate_s4")
    } else if (type == "R6") {
        UseMethod("new_rate_r6")
    }
}
new_rate_s3 <- function(x) {
    UseMethod("new_rate_s3")
}
new_rate_s3.numeric <- function(x) {
    numeric_rate_s3(x)
}
new_rate_s3.character <- function(x) {
    factor_rate_s3(x)
}
new_rate_s4 <- function(x) {
    UseMethod("new_rate_s4")
}
new_rate_s4.numeric <- function(x) {
    st <- Sys.time()
    new("NumericRate", value = x, id = digest::digest(as.numeric(st) * 1000), timestamp = st)
}
new_rate_s4.character <- function(x) {
    st <- Sys.time()
    new("FactorRate", value = x, id = digest::digest(as.numeric(st) * 1000), timestamp = st)
}
new_rate_r6 <- function(x) {
    UseMethod("new_rate_r6")
}
new_rate_r6.numeric <- function(x) {
    numeric_rate_r6$new(x)
}
new_rate_r6.character <- function(x) {
    factor_rate_r6$new(x)
}