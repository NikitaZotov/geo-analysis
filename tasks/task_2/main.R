library(data.table)

source("lib/statistics.R")

table <- fread("data/copper_content_samples.csv")
table <- table[order(table$percentage),]

e_value <- expected_value(table$percentage, table$length)
e_value

r_e_value <- ranged_expected_value(table$percentage, 3, table$length)
r_e_value

dispersion <- dispersion(table$length, e_value)
dispersion

rmsv <- root_mean_square_deviation(table$length, e_value)
rmsv
