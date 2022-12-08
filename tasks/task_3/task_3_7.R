library("countreg")
library("circlize")
library("aplpack")
library("pracma")

# 7. Построить полунормальный график и график нормального распределения с удаленным трендом.
library("fdrtool")
x <- seq(0, 10, by = 0.01)
y_dhalfnorm <- dhalfnorm(x)
plot(y_dhalfnorm)
