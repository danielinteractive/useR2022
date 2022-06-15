setClass(
    "Rate",
    slots = list(
        id = "character",
        timestamp = "POSIXct"
    )
)
setClass("RateS4", contains = "Rate")
setClass(
    "NumericRate",
    slots = list(
        value = "numeric"
    ),
    prototype = list(
        value = NA_real_
    ),
    contains = "RateS4"
)
setValidity(
    "NumericRate",
    function(object) {
        if (is.numeric(object@value) && length(object@value) == 1) {
            TRUE
        } else {
            "@value must be a single numeric value"
        }
    }
)
setClass(
    "FactorRate",
    slots = list(
        value = "character"
    ),
    prototype = list(
        value = NA_character_
    ),
    contains = "RateS4"
)
setValidity(
    "FactorRate",
    function(object) {
        if (is.character(object@value) && length(object@value) == 1) {
            TRUE
        } else {
            "@value must be a single character value"
        }
    }
)