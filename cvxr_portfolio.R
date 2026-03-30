library(CVXR)

load("data/returns.RData")

mu <- colMeans(returns)
Sigma <- cov(returns)
n <- length(mu)

w <- Variable(n)

objective <- Minimize(quad_form(w, Sigma))
constraints <- list(sum(w) == 1, w >= 0)

prob <- Problem(objective, constraints)
result <- solve(prob)

weights_cvxr <- result$getValue(w)

save(weights_cvxr, file = "results/cvxr_weights.RData")