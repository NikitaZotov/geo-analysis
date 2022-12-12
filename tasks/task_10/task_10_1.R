table(rpois(100,5))

with(airquality, table(cut(Temp, quantile(Temp)), Month))

ftable(Titanic, row.vars = 1:3)
