library("countreg")
library("circlize")
library("aplpack")
library("pracma")

# 5. Построить кривые Эндрюса
data(iris)
s <- sample(1:4, 4)
A <- as.matrix(iris[, s])
f <- as.integer(iris[, 5])
andrewsplot(A, f, style = "cart")
