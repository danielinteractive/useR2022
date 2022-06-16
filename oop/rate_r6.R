rate_r6 <- R6::R6Class(
    classname = c("RateR6", "Rate"),
    public = list(
        initialize = function(x) {
            self$value <- x
            st <- Sys.time()
            private$id <- digest::digest(as.numeric(st) * 1000)
            private$timestamp <- st
            private$validate()
        },
        value = NA
    ),
    private = list(
        id = character(0),
        timestamp = NULL,
        validate = function() {
            TRUE
        }
    )
)
numeric_rate_r6 <- R6::R6Class(
    classname = "NumericRate",
    inherit = rate_r6,
    private = list(
        validate = function() {
            stopifnot(is.numeric(self$value) && length(self$value) == 1)
        }
    )
)
factor_rate_r6 <- R6::R6Class(
    classname = "FactorRate",
    inherit = rate_r6,
    private = list(
        validate = function() {
            stopifnot(is.character(self$value) &&  length(self$value) == 1)
        }
    )
)