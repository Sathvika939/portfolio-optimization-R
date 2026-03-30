load("data/returns.RData")

n <- ncol(returns)
weights_ew <- rep(1/n, n)

save(weights_ew, file = "results/ew_weights.RData")