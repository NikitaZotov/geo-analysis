library("countreg")
library("circlize")
library("aplpack")
library("pracma")

# 4. Построить график «Лица Чернова»
data <- na.omit(airquality)
faces(data)
