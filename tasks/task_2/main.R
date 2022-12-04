library(data.table)

source("lib/statistics.R")

table <- fread("data/copper_content_samples.csv")
table <- sort_table(table, table$percentage)

# вектор весов наблюдений
w <- table$percentage
# вектор наблюдений
x <- table$length
# ширина группы вессов наблюдений
group_width <- 1.8

# среднее значение
m <- average(w, x)
m

# среднее значение по интервалам
r_m <- ranged_average(w, group_width, x)
r_m

# мода
ma <- moda(w, group_width)
ma

# медиана
me <- median(w, group_width)
me

# дисперсия
d <- dispersion(x, m)
d

# дисперсия по интервалам
r_d <- ranged_dispersion(w, group_width, x)
r_d

# среднее квадратичное отклонение
rmsv <- root_mean_square_deviation(x, r_m)
rmsv

p_sk_f <- Pearson_skewness_factor(r_m, me, rmsv)
p_sk_f

# коэффициент вариации
v <- variation(rmsv, r_m)
v

# среднее абсолютное отклонение
rmav <- root_mean_absolute_deviation(x, r_m)
rmav

# размах
range <- range(x)
range
