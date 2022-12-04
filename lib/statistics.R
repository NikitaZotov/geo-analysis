source("lib/tables.R")

#' Вычисляет математическое ожидание вектора наблюдей x c весами из вектора w
#' @param w - вектор весов наблюдений
#' @param x - вектор наблюдений
#' @returns Значение величины математического ожидания вектора наблюдей x c весами из вектора w
expected_value <- function (w, x) {
    value <- sum(w * x) / sum(w)
    return(value)
}

#' Вычисляет математическое ожидание вектора наблюдей x c весами из вектора w, предварительно сгруппировав веса
#' вектора w в интервалах от i до i + group_lenth, i < length(w)
#' @param w - вектор весов наблюдений
#' @param group_lenth - длина группы весов наблюдений из вектора w
#' @param x - вектор наблюдений
#' @returns Значение величины математического ожидания вектора наблюдей x c весами из вектора w
ranged_expected_value <- function (w, group_lenth, x) {
    ranged_table <- range_table(w, group_lenth, x)

    w <- (ranged_table$begin + ranged_table$end) / 2
    m <- ranged_table$total

    value <- sum(w * m) / sum(m)
    return(value)
}

dispersion <- function (x, group_length) {
    value <- sum(x - group_length) / length(x)
    return(value)
}

root_mean_square_deviation <- function (x, group_length) {
    value <- sqrt(dispersion(x, group_length))
    return(value)
}
