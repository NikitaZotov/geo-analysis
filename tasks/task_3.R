library("countreg")
library("circlize")
library("aplpack")
library("pracma")

# 1. Построить график «Ящик с усами»
boxplot(airquality)
boxplot(airquality$Temp)

# 2. Построить график «Висячая гистограмма»

dummy <- rnbinom(200, size = 1.5, prob = 0.8)
observed <- table(dummy)
fitted <- dnbinom(as.numeric(names(observed)),
                   size = 1.5, prob = 0.8) * sum(observed)
rootogram(observed, fitted)

# 3. Построить циркулярные графики
data <- data.frame(
    factor = sample(letters[1:8], 1000, replace = TRUE),
    x = rnorm(1000),
    y = runif(1000)
    )
 
# Step1: Initialise the chart giving factor and x-axis.
circos.initialize( factors=data$factor, x=data$x )

# Step 2: Build the regions.
circos.trackPlotRegion(factors = data$factor, y = data$y, panel.fun = function(x, y) {
    circos.axis()
    })

# Step 3: Add points
circos.trackPoints(data$factor, data$x, data$y, col = "blue", pch = 16, cex = 0.5)

# 4. Построить график «Лица Чернова»
data <- na.omit(airquality)
faces(data)

# 5. Построить кривые Эндрюса
data(iris)
s <- sample(1:4, 4)
A <- as.matrix(iris[, s])
f <- as.integer(iris[, 5])
andrewsplot(A, f, style = "cart")

# 6. Построить график нормального распределения на вероятностной бумаге
par(mfrow=c(1,2))
x <- rt(100, df=3)
qqnorm(x)
qqline(x)

# 7. Построить полунормальный график и график нормального распределения с удаленным трендом.
library("fdrtool")
x <- seq(0, 10, by = 0.01)
y_dhalfnorm <- dhalfnorm(x)
plot(y_dhalfnorm)

# 8. Построить Р–Р-график.
linearModelVar <- lm(airquality)

unstandardizedPredicted <- predict(linearModelVar)
unstandardizedResiduals <- resid(linearModelVar)
standardizedPredicted <- (unstandardizedPredicted - mean(unstandardizedPredicted)) / sd(unstandardizedPredicted)
standardizedResiduals <- (unstandardizedResiduals - mean(unstandardizedResiduals)) / sd(unstandardizedResiduals)

probDist <- pnorm(standardizedResiduals)
plot(ppoints(length(standardizedResiduals)), sort(probDist), main = "PP Plot", xlab = "Observed Probability", ylab = "Expected Probability")
abline(0,1)
