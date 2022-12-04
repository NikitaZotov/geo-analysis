source("lib/tables.R")

#' Вычисляет математическое ожидание вектора наблюдей x c весами из вектора w
#' @param w - вектор весов наблюдений
#' @param x - вектор наблюдений
#' @returns Значение величины математического ожидания вектора наблюдей x c весами из вектора w
average <- function (w, x) {
    value <- sum(w * x) / sum(w)
    return(value)
}

#' Вычисляет математическое ожидание вектора наблюдей x c весами из вектора w, предварительно сгруппировав веса
#' вектора w в интервалах от i до i + group_lenth, i < length(w)
#' @param w - вектор весов наблюдений
#' @param group_width - длина группы весов наблюдений из вектора w
#' @param x - вектор наблюдений
#' @returns Значение величины математического ожидания вектора наблюдей x c весами из вектора w
ranged_average <- function (w, group_width, x) {
    ranged_table <- range_table(w, group_width, x)

    c <- (ranged_table$begin + ranged_table$end) / 2
    m <- ranged_table$total

    value <- sum(c * m) / sum(m)
    return(value)
}

moda <- function (w, group_width) {
    ranged_table <- frequent_table(w, group_width)

    frequencies <- ranged_table$observation_frequency
    max_frequency_index <- which.max(frequencies)
    d_a <- frequencies[max_frequency_index] - frequencies[max_frequency_index - 1]
    d_b <- frequencies[max_frequency_index] - frequencies[max_frequency_index + 1]
    down_edge <- ranged_table$begin[max_frequency_index]

    value <- down_edge + d_a / (d_a + d_b) * group_width
    return(value)
}

median <- function (w, group_width) {
    ranged_table <- frequent_table(w, group_width)

    frequencies <- ranged_table$observation_frequency
    max_frequency_index <- which.max(frequencies)
    F <- ranged_table$observations[max_frequency_index - 1]
    f <- ranged_table$observation_frequency[max_frequency_index]
    down_edge <- ranged_table$begin[max_frequency_index]

    value <- down_edge + (length(w) / 2 - F) / f * group_width
    return(value)
}

Pearson_skewness_factor <- function (m, me, rmsv) {
    value <- 3 * (m - me) / rmsv
    return(value)
}

dispersion <- function (x, m) {
    value <- sum((x - m) ^ 2) / length(x)
    return(value)
}

ranged_dispersion <- function (w, group_width, x) {
    ranged_table <- range_table(w, group_width, x)

    c <- (ranged_table$begin + ranged_table$end) / 2
    m <- ranged_table$total
    average_c <- sum(c) / length(c)
    sum_m <- sum(m)

    value <- (sum((c ^ 2) * m) - (average_c ^ 2) * sum_m) / sum_m
    return(value)
}

root_mean_square_deviation <- function (x, m) {
    value <- sqrt(sum((x - m) ^ 2) / length(x))
    return(value)
}

variation <- function (r, m) {
    value <- (r / m) * 100
    return (value)
}

root_mean_absolute_deviation <- function (x, m) {
    value <- sum(abs(x - m)) / length(x)
    return(value)
}

range <- function(x) {
    value <- max(x) - min(x)
    return(value)
}
