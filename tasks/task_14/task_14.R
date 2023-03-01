library(ggplot2)
library(tseries)

# Загрузка данных
data <- read.csv("data.csv")
# Data.csv может быть файлом, содержащим данные для построения модели
# регрессии.
# Он должен содержать два столбца - названия переменных (x и y) и их
# соответствующие значения.

# Построение модели регрессии
model <- lm(y ~ x, data = data)

# Проверка модели
summary(model)

# Построение графиков регрессии
plot(model)
scatterplot(y ~ x, data = data)
residuals <- residuals(model)
fitted(model)
residuals.lm(model)

# Графики распределения остатков
ggplot(data = model, aes(x = x, y = residuals)) +
  geom_point() +
  geom_hline(yintercept = 0, color = "red") +
  xlab("x") +
  ylab("residuals") +
  ggtitle("Residual Plot")

# Двумерные графики рассеяния (скаттерограммы) остатков:
ggplot(data = model, aes(x = x, y = residuals)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  xlab("x") +
  ylab("residuals") +
  ggtitle("Residual Plot")

# Автокорреляция остатков
dwtest(model$residuals)
