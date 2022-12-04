source("lib/tables.R")

expected_value <- function (w, x) {
    value <- sum(w * x) / sum(w)
    return(value)
}

ranged_expected_value <- function (table, rangable, range_length, summarizable) {
    ranged_table <- range_table(table, rangable, range_length, summarizable)

    w <- (ranged_table$begin + ranged_table$end) / 2
    m <- ranged_table$total

    value <- sum(w * m) / sum(m)
    return(value)
}