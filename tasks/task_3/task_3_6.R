library("countreg")
library("circlize")
library("aplpack")
library("pracma")

# 6. Построить график нормального распределения на вероятностной бумаге
par(mfrow=c(1,2))
x <- rt(100, df=3)
qqnorm(x)
qqline(x)
