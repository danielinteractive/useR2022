.RateCollectorS4 <- setClass(
    "RateCollectorS4",
    slots = c(
        rates = "list"
    ),
    prototype = list(
        rates = list()
    )
)
.NumericRateCollector <- setClass(
    "NumericRateCollector",
    contains = "RateCollectorS4"
)
setValidity(
    "NumericRateCollector",
    function(object) {
        if (is.list(object@rates) && vapply(object@rates, inherits, logical(1), "NumericRate")) {
            "@rates must be a list with all elements of numeric_rate class"
        } else {
            TRUE
        }
    }
)
.FactorRateCollector <- setClass(
    "FactorRateCollector",
    contains = "RateCollectorS4"
)
setValidity(
    "FactorRateCollector",
    function(object) {
        if (is.list(object@rates) && vapply(object@rates, inherits, logical(1), "FactorRate")) {
            "@rates must be a list with all elements of factor_rate class"
        } else {
            TRUE
        }
    }
)
