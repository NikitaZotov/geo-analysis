# Создание двух объектов
obj1 <- c(1, 2, 3)
obj2 <- c(4, 5, 6)

# Вычисление евклидова расстояния
dist_euclidean <- sqrt(sum((obj1 - obj2)^2))

# Создание матрицы данных
data <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3)

# Вычисление матрицы расстояний между объектами
dist_matrix <- dist(data)

# Иерархическая классификация
hc <- hclust(dist_matrix)

# Создание матрицы данных
data <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3)

# Кластеризация методом k-средних
kmeans_res <- kmeans(data, centers = 2)

# Сохранение номера класса для каждого наблюдения
class_labels <- kmeans_res$cluster

