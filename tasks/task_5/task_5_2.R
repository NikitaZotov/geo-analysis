# 2. Проверить гипотезу однородности распределений в двух генеральных совокупностях с помощью критерия χ2.
data1 <- rnorm(300)
data2 <- rnorm(300)

par(mfrow=c(1,2))
plot(data1, col = "blue")
plot(data2, col = "red")

chisq.test(data1, data2)
