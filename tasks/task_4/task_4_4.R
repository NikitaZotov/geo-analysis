# Создаём последовательность случайных чисел
x <- seq(0.01, 5, by=0.01)

# Вычисляем значений плотностей и функций гамма-распределения
y1 <- dgamma(x, 0.5, 0.5)
z1 <- pgamma(x, 0.5, 0.5)

op <- par(mfrow=c(1, 2))

# Строим графики плотностей распределения, создаём легенду, размечаем оси графиков
plot(x, y1, type="l", xlab="x", ylab="p(x)", ylim=c(0, 3))
curve(dgamma(x, 0.8, 0.8), add=T, lty=2)
curve(dgamma(x, 1, 1), add=T, lty=3)
curve(dgamma(x, 5, 5), add=T, lty=4)
curve(dgamma(x, 10, 10), add=T, lty=5)
curve(dgamma(x, 10, 20), add=T, lty=6)
legend("topright", c(expression(G(0.5, 0.5)), expression(G(0.8, 0.8)), expression(G(1, 1)), expression(G(5, 5)), expression(G(10, 10)), expression(G(10, 20))), lty=1:6)
title(main=expression(p(x)), xlab="x", ylab="p(x)")

# Строим графики функций распределения, создаём легенду, размечаем оси графиков
plot(x, z1, type="l", xlab="x", ylab="F(x)", ylim=c(0, 1.1), lty=1)
curve(pgamma(x, 0.8, 0.8), add=T, lty=2)
curve(pgamma(x, 1, 1), add=T, lty=3)
curve(pgamma(x, 5, 5), add=T, lty=4)
curve(pgamma(x, 10, 10), add=T, lty=5)
curve(pgamma(x, 10, 20), add=T, lty=6)
legend("bottomright", c(expression(G(0.5, 0.5)), expression(G(0.8, 0.8)), expression(G(1, 1)), expression(G(5, 5)), expression(G(10, 10)), expression(G(10, 20))), lty=1:6)
title(main=expression(F(x)))

par(op)