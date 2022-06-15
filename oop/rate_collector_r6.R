rate_collector_r6 <- R6::R6Class(
    classname = "RateCollectorR6",
    public = list(
        initialize = function() {
            self$rates <- shiny::reactiveVal(list())
        },
        rates = NULL,
        add_rate = function(x) {
            self$rates(c(self$rates(), list(x)))
            private$validate()
            self
        },
        get_value = function() {
            sapply(self$rates(), get_value)
        }
    ),
    private = list(
        validate = function() {
            stop("Abstract class method")
        }
    )
)
numeric_rate_collector_r6 <- R6::R6Class(
    classname = "NumericRateCollector",
    inherit = rate_collector_r6,
    private = list(
        validate = function() {
            stopifnot(is.list(self$rates()) && vapply(self$rates(), inherits, logical(1), "NumericRate"))
        }
    )
)
factor_rate_collector_r6 <- R6::R6Class(
    classname = "FactorRateCollector",
    inherit = rate_collector_r6,
    private = list(
        validate = function() {
            stopifnot(is.list(self$rates()) && vapply(self$rates(), inherits, logical(1), "FactorRate"))
        }
    )
)