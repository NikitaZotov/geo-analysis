# Загрузка данных
data(iris)

# Разделение данных на обучающую и тестовую выборки
train <- sample(nrow(iris), 0.7 * nrow(iris))
test <- setdiff(1:nrow(iris), train)

# Построение дерева
library(rpart)
tree_model <- rpart(Species ~ ., data = iris[train, ], method = "class", control = rpart.control(split = "gini", minsplit = 10))

# Визуализация дерева
plot(tree_model)
text(tree_model)

# Оценка точности модели
tree_predict <- predict(tree_model, newdata = iris[test, ], type = "class")
table(tree_predict, iris[test, 5])

# Размер дерева
printcp(tree_model)
