x1 <- rnorm(n=200, mean=5, sd=2)
x2 <- rnorm(200, 2, 3)

y <- x1 + x2^2 + x1*x2 + rnorm(200, 0, 0.5)

df <- data.frame(y, x1, x2)

train.ids <- 1:100
test.ids <- 101:200

m1 <- lm(y ~ x1 + x2, df[train.ids,])
summary(m1)
plot(m1)
