# Создаём последовательность случайных чисел
x <- seq(-5,5, by=0.1)

# Вычисляем значений плотностей и функций нормального распределения
y1 <- dnorm(x)
y2 <- dnorm(x,1,1)
y3 <- dnorm(x, mean=-1, sd=2)
z1 <- pnorm(x)
op <- par(mfrow=c(2, 1))

# Строим графики плотностей распределения, создаём легенду, размечаем оси графиков
plot(x, y1, type="l", col="red", xlab="x", ylab="p(x)", ylim=c(0, max(y1, y2, y3)))
curve(dnorm(x, 1, 1), col="blue", add=T)
curve(dnorm(x, mean=-1, sd=2), col="violet", add=T)
legend("topright", c(expression(N(0,1)), expression(N(1,1)), expression(N(-1,2))), col=c("red","blue","violet"), lty=1)
title(main=expression(p(x)),xlab="x",ylab="p(x)")

# Строим графики функций распределения, создаём легенду, размечаем оси графиков
plot(x, z1, type="l", col="red", xlab="x", ylab="F(x)", ylim=c(0,1.1))
curve(pnorm(x, 1, 1), col="blue", add=T)
curve(pnorm(x, sd=2, mean=-1), col="violet", add=T)
legend("bottomright", c(expression(N(0,1)),
expression(N(1,1)), expression(N(-1,2))), col=c("red", "blue", "violet"), lty=1)
title(main=expression(F(x)))

par(op)
