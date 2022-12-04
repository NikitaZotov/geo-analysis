library(data.table)

source("lib/statistics.R")

table <- fread("data/copper_content_samples.csv")
table <- table[order(table$percentage),]

m <- average(table$percentage, table$length)
m

r_m <- ranged_average(table$percentage, 3, table$length)
r_m

d <- dispersion(table$length, m)
d

r_d <- ranged_dispersion(table$percentage, 3, table$length)
r_d

rmsv <- root_mean_square_deviation(table$length, m)
rmsv

v <- variation(rmsv, m)
v
