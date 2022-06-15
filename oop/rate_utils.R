# S3 methods for convinience
get_value <- function(x) {
    UseMethod("get_value")
}
get_value.RateS3 <- function(x) {
    x$value
}
get_value.RateS4 <- function(x) {
    x@value
}
get_value.RateR6 <- function(x) {
    x$value
}