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

dispersion <- function (x, m) {
    value <- sum((x - m) ^ 2) / length(x)
    return(value)
}

ranged_dispersion <- function (w, group_width, m) {
    ranged_table <- range_table(w, group_width, m)

    c <- (ranged_table$begin + ranged_table$end) / 2
    m <- ranged_table$total
    average_c <- average(rep(1, length(c)), c)
    sum_m <- sum(m)

    value <- (sum((c ^ 2) * m) - sum_m * average_c) / sum_m
    return(value)
}

root_mean_square_deviation <- function (d) {
    value <- sqrt(d)
    return(value)
}

variation <- function (r, m) {
    value <- r / m * 100
    return (value)
}
