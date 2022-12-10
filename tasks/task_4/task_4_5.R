# Создаём последовательность случайных чисел
x <- seq(0, 10, by=0.01)

# Вычисляем значений плотностей и функций распределения Вейбулла
y1 <- dlogis(x, 0.5, 0.5)
z1 <- plogis(x, 0.5, 0.5)

op <- par(mfrow=c(1, 2))

# Строим графики плотностей распределения, создаём легенду, размечаем оси графиков
plot(x, y1, type="l", xlab="x", ylab="p(x)", ylim=c(0, 1), lwd=2)
curve(dweibull(x, 0.5, 1), add=T, lty=2)
curve(dweibull(x, 0.5, 2), add=T, lty=3)
curve(dweibull(x, 1, 1), add=T, lty=4)
curve(dweibull(x, 1, 2), add=T, lty=5)
curve(dweibull(x, 2, 1), add=T, lty=6)
legend(2, 0.6, c(expression(W(0.5, 0.5)), expression(W(0.5, 1)), expression(W(0.5, 2)), expression(W(1, 1)), expression(W(1, 2)), expression(W(2, 1))), lty=1:6, cex=0.7)
title(main=expression(p(x)), xlab="x", ylab="p(x)")

# Строим графики функций распределения, создаём легенду, размечаем оси графиков
plot(x, z1, type="l", xlab="x", ylab="F(x)", ylim=c(0, 1.1), lty=1, lwd=2)
curve(pweibull(x, 0.5, 1), add=T, lty=2)
curve(pweibull(x, 0.5, 2), add=T, lty=3)
curve(pweibull(x, 1, 1), add=T, lty=4)
curve(pweibull(x, 1, 2), add=T, lty=5)
curve(pweibull(x, 2, 1), add=T, lty=6)
legend(3, 0.3, c(expression(W(0.5, 0.5)), expression(W(0.5, 1)), expression(W(0.5, 2)),  expression(W(1, 1)), expression(W(1, 2)), expression(W(2, 1))), lty=1:6, cex=0.7)
title(main=expression(F(x)))

par(op)
