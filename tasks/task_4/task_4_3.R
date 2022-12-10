# Создаём последовательность случайных чисел
x <- seq(0, 15, by=0.01)

# Вычисляем значений плотностей и функций логрмального распределения
y1 <- dlnorm(x, -1, 0.5)
z1 <- plnorm(x, -1, 0.5)

op <- par(mfrow=c(1, 2))

# Строим графики плотностей распределения, создаём легенду, размечаем оси графиков
plot(x, y1, type="l", xlab="x", ylab="p(x)", ylim=c(0, 2.5))
curve(dlnorm(x, -1, 2), add=T, lty=2)
curve(dlnorm(x, 0, 1), add=T, lty=3)
curve(dlnorm(x, 1, 0.5), add=T, lty=4)
curve(dlnorm(x, 1, 2), add=T, lty=5)
curve(dlnorm(x, 1, 3), add=T, lty=6)
legend(3, 2.5, c(expression(LN(-1, 0.5)), expression(LN(-1, 2)), expression(LN(0, 1)),  expression(LN(1, 0.5)), expression(LN(1, 2)), expression(LN(1, 3))), lty=1:6, cex=0.7)
title(main=expression(p(x)), xlab="x", ylab="p(x)")

# Строим графики функций распределения, создаём легенду, размечаем оси графиков
plot(x, z1, type="l", xlab="x", ylab="F(x)", ylim=c(0, 1.1), lty=1)
curve(plnorm(x, -1, 2), add=T, lty=2)
curve(plnorm(x, 0, 1), add=T, lty=3)
curve(plnorm(x, 1, 0.5), add=T, lty=4)
curve(plnorm(x, 1, 2), add=T, lty=5)
curve(plnorm(x, 1, 3), add=T, lty=6)
legend(3, 0.3, c(expression(LN(-1, 0.5)), expression(LN(-1, 2)), expression(LN(0, 1)),  expression(LN(1, 0.5)), expression(LN(1, 2)), expression(LN(1, 3))), lty=1:6, cex=0.7)
title(main=expression(F(x)))

par(op)
