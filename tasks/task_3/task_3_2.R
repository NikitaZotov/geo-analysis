library("countreg")
library("circlize")
library("aplpack")
library("pracma")

# 2. Построить график «Висячая гистограмма»

dummy <- rnbinom(200, size = 1.5, prob = 0.8)
observed <- table(dummy)
fitted <- dnbinom(as.numeric(names(observed)),
                   size = 1.5, prob = 0.8) * sum(observed)
rootogram(observed, fitted)

