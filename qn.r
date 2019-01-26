lambda <- 0.2
x <- rexp(50000, lambda)
plot(sort(x), main="Scatter Plot for X")
x0 <- matrix(data=x, nrow=100, ncol=500)
x1 <- ecdf(x[1:100])
plot(x1, main="CDF for first vector")
x2 <- ecdf(x[101:200])
plot(x2, main="CDF for second vector")
x3 <- ecdf(x[201:300])
plot(x3, main="CDF for third vector")
x4 <- ecdf(x[301:400])
plot(x4, main="CDF for fourth vector")
x5 <- ecdf(x[401:500])
plot(x5, main="CDF for fifth vector")
x6 <- density(x[1:100])
plot(x6, main="PDF for first vector")
x7 <- density(x[101:200])
plot(x7, main="PDF for second vector")
x8 <- density(x[201:300])
plot(x8, main="PDF for third vector")
x9 <- density(x[301:400])
plot(x9, main="PDF for fourth vector")
x10 <- density(x[401:500])
plot(x10, main="PDF for fifth vector")

mn <- apply(x0, 1, mean)
sde <- apply(x0, 1, sd)

print(mn[1])
print(mn[2])
print(mn[3])
print(mn[4])
print(mn[5])


print(sde[1])
print(sde[2])
print(sde[3])
print(sde[4])
print(sde[5])

tab <- table(round(x0))
plot(tab, main="Frequency")

plot(ecdf(mn), main="cumulative distribution function (CDF)")
plot(density(mn), main="probability density function
(PDF)")

mn1 <- mean(mn)
sde1 <- sd(mn)

print(mean(x))
print(mn1)
print(sde1)
