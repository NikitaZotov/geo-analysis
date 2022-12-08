library("countreg")
library("circlize")
library("aplpack")
library("pracma")

# 8. Построить Р–Р-график.
linearModelVar <- lm(airquality)

unstandardizedPredicted <- predict(linearModelVar)
unstandardizedResiduals <- resid(linearModelVar)
standardizedPredicted <- (unstandardizedPredicted - mean(unstandardizedPredicted)) / sd(unstandardizedPredicted)
standardizedResiduals <- (unstandardizedResiduals - mean(unstandardizedResiduals)) / sd(unstandardizedResiduals)

probDist <- pnorm(standardizedResiduals)
plot(ppoints(length(standardizedResiduals)), sort(probDist), main = "PP Plot", xlab = "Observed Probability", ylab = "Expected Probability")
abline(0,1)
