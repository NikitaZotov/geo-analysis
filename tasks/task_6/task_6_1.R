# малая солнечная активность
wilcox.test(Ozone ~ Month, data=airquality, subset=Month %in% c(5, 8))

# большая солнечная активность
wilcox.test(Solar.R ~ Month, data=airquality, subset=Month %in% c(5, 8))

# распределение температуры
wilcox.test(Temp ~ Month, data=airquality, subset=Month %in% c(5, 8))

# распределение ветра
wilcox.test(Wind ~ Month, data=airquality, subset=Month %in% c(5, 8))

boxplot(Temp ~ Month, data=airquality, subset=Month %in% c(5, 8))

# сравнение распределений двух выборок
x <- rnorm(50, mean=0)
y <- rnorm(50, mean=2)
wilcox.test(x, y)

wilcox.test(x, y, mu=-2)
