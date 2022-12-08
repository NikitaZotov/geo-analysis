library("countreg")
library("circlize")
library("aplpack")
library("pracma")

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
