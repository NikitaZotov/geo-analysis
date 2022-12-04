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

m <- average(w, x)
m

r_m <- ranged_average(w, group_width, x)
r_m

d <- dispersion(x, m)
d

r_d <- ranged_dispersion(w, group_width, x)
r_d

rmsv <- root_mean_square_deviation(d)
rmsv

v <- variation(rmsv, m)
v
