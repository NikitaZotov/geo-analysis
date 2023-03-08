# Загрузка данных
data <- read.csv("data.csv")

# Анализ главных компонент
res <- prcomp(data, scale = TRUE)

# Вывод результатов
summary(res)

# Матрица корреляции
corr_matrix <- cor(data)

# Редукция корреляционной матрицы
red_corr_matrix <- corr_matrix - res$rotation %*% t(res$rotation)

# Остаточная корреляционная матрица
res_corr_matrix <- red_corr_matrix - diag(diag(red_corr_matrix))

# Простая факторная структура
factors <- varimax(res$rotation)

# Интерпретация факторного решения
print(factors$loadings)

# Матрица факторных значений F
F_matrix <- res$x %*% t(res$rotation)
