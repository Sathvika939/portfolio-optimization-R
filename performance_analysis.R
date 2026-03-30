library(PerformanceAnalytics)

load("data/returns.RData")
load("results/mvo_weights.RData")
load("results/ew_weights.RData")
load("results/cvxr_weights.RData")

ret_mvo <- Return.portfolio(returns, weights_mvo)
ret_ew  <- Return.portfolio(returns, weights_ew)
ret_cvxr <- Return.portfolio(returns, weights_cvxr)

charts.PerformanceSummary(cbind(ret_mvo, ret_ew, ret_cvxr))

table.AnnualizedReturns(cbind(ret_mvo, ret_ew, ret_cvxr))