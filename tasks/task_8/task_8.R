library(dplyr)
library(GGally)

# загрузка выборки
data <- read.csv("https://raw.githubusercontent.com/guru99-edu/R-Programming/master/british_household.csv")

# вычисление коэффициента корреляции между доходами и расходами на еду с помощью метода “pearson”
cor(data$income, data$wfood, method="pearson")

# вычисление коэффициента корреляции между доходами и расходами на еду с помощью метода “spearman”
cor(data$income, data$wfood, method="spearman")

# не включаем последнюю колонку с выбросами
mat_1 <- as.dist(round(cor(data[, 1:9]), 2))
mat_1

# тепловая карта
data_rcorr <- as.matrix(data[, 1: 9])

# тепловая карта корелляционной матрицы
ggcorr(
  data,
  method=c("pairwise", "pearson"),
  nbreaks=NULL, digits=2, low="#3B9AB2",
  mid="#EEEEEE", high="#F21A00",
  geom="tile", label=FALSE,
  label_alpha=FALSE
)

# детализированная тепловая карта корелляционной матрицы
ggcorr(
  data,
  nbreaks=7,
  low="steelblue",
  mid="white",
  high="darkred",
  geom="circle"
)
