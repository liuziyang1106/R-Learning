
# 模拟特定分布的数据
r1 <- rnorm(n = 100, mean = 0, sd = 1)
r2 <- runif(n = 1000, min = 0, max = 100)
r3 <- rbinom(n = 80, size = 100, prob = 0.2)
r4 <- rpois(n = 50, lambda = 1)