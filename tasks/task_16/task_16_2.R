# Загрузка данных
data <- read.csv("data.csv")

# Анализ дисперсии
model <- aov(data$y ~ data$soil + data$stimulator)

# Вывод результатов
summary(model)
