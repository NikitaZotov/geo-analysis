library(foreign)
library(ggplot2)
library(visreg)

model <- lm(data=airquality)
summary(model)
visreg(model, "Temp", by = "Ozone", overlay=TRUE, band=TRUE)
