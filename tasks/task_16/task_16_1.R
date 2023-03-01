# Загрузка библиотеки
library(car)

# Загрузка данных
data <- read.csv("exam_results.csv")

# Вычисление ANOVA
model <- aov(data$score ~ data$learning_style + data$teaching_method)

# Анализ ANOVA
anova <- Anova(model, type = "III")

# Вывод результатов ANOVA
summary(anova)
