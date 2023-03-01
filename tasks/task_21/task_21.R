library("MASS")
library("class")
library("ggplot2")
library("magrittr")
library("dplyr")
library("BSDA")
require(caret)
# 1. Вычислить линейную дискриминантную функцию.
# 2. Построить решающее правило для классификации случайного наблюдения и определить точность построенного правила.
# 3. Проверить гипотезы о значении расстояния Махаланобиса между центрами классов и о равенстве векторов теоретических средних классов.

# Load the data
data("iris")

# Split the data into training (80%) and test set (20%)
set.seed(123)
training.individuals <- iris$Species %>%
            createDataPartition(p = 0.8, list = FALSE)
train.data <- iris[training.individuals, ]
test.data <- iris[-training.individuals, ]

# Estimate preprocessing parameters
preproc.parameter <- train.data %>%
  preProcess(method = c("center", "scale"))

# Transform the data using the estimated parameters
train.transform <- preproc.parameter %>% predict(train.data)
test.transform <- preproc.parameter %>% predict(test.data)

# Fit the model
model <- lda(Species~., data = train.transform)

# Make predictions
predictions <- model %>% predict(test.transform)

# Model accuracy
mean(predictions$class==test.transform$Species)

model

#

# Задаем средние вектора классов
mu1 <- c(1,1)
mu2 <- c(2,2)
# Задаем расстояние Махаланобиса
mahalanobis_distance <- mahalanobis(mu1, mu2)
# Проверяем гипотезу о равенстве векторов теоретических средних классов с помощью теста Фишера
fisher.test(mu1, mu2)
# Проверяем гипотезу о значении расстояния Махаланобиса между центрами классов с помощью теста Критерия Фишера
fisher.test(mahalanobis_distance)
