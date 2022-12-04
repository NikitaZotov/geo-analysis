library(data.table)

source("lib/statistics.R")

table <- fread("data/copper_content_samples.csv")

e_value <- expected_value(table$percentage, table$length)
print(e_value)
