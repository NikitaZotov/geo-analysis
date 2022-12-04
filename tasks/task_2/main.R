library(data.table)

source("lib/statistics.R")

table <- fread("data/copper_content_samples.csv")
table <- sort_table(table, table$percentage)

# вектор весов наблюдений
w <- table$percentage
# вектор наблюдений
x <- table$length
# ширина группы вессов наблюдений
group_width <- 3

# среднее значение
m <- average(w, x)
m

# среднее значение по интервалам
r_m <- ranged_average(w, group_width, x)
r_m

# дисперсия
d <- dispersion(x, m)
d

# дисперсия по интервалам
r_d <- ranged_dispersion(w, group_width, x)
r_d

# среднее квадратичное отклонение
rmsv <- root_mean_square_deviation(x, m)
rmsv

# коэффициент вариации
v <- variation(rmsv, m)
v

# среднее абсолютное отклонение
rmav <- root_mean_absolute_deviation(x, m)
rmav

# размах
range <- range(x)
range

moda(w, group_width)
