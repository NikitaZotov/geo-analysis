# 3. Построить эмпирическую функцию распределения и столбиковую диаграмму для дискретной случайной величины.

# Dataset про погоду в Нью-Йорке
# Столбиковая диаграмма частоты
hist(airquality$Temp)

# Столбиковая диаграмма распределения вероятности
hist(airquality$Temp, freq = FALSE, col = "lightblue",
     ylab = "Плотность вероятности", xlab = "Температура", main = "Гистограмма температуры")

# Кривая плотности вероятности + столбиковая диаграмма
lines(density(airquality$Temp))

# Кривая нормального распределения для сравнения
curve(dnorm(x, mean = mean(airquality$Temp, na.rm = TRUE),
             sd = sd(airquality$Temp, na.rm = TRUE)), add = TRUE, col = 'red')
