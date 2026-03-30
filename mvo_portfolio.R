library(PortfolioAnalytics)

load("data/returns.RData")

port <- portfolio.spec(assets = colnames(returns))
port <- add.constraint(port, type = "full_investment")
port <- add.constraint(port, type = "long_only")

port <- add.objective(port, type = "return", name = "mean")
port <- add.objective(port, type = "risk", name = "StdDev")

opt <- optimize.portfolio(returns, port, optimize_method = "random")
weights_mvo <- extractWeights(opt)

save(weights_mvo, file = "results/mvo_weights.RData")