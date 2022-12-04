library(data.table)

table <- fread("../data/copper_content_samples.csv")
print(table$length)
