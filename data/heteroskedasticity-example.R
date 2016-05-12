#' The example comes from the Car library
library("car")
#' The sandwich library calculates heteroskedasticity robust standard errors
library("sandwich")
#' The lmtest contains 
library("lmtest")

#' Example regression model
mod <- lm(prestige ~ income, data = Duncan)
#' By default, the standard errors calculated under the assumption of 
#' homoskedasticity
sqrt(diag(vcov(mod)))

#' Use the function vcovHC to calculate a variance-covariance
#' matrix that corrects for heteroskedasticity
mod_vcov_hc <- vcovHC(mod)
#' The standard errors are a little different
sqrt(diag(mod_vcov_hc))

#' Use coeftest to calculate a variance-covariance matrix matrix
coeftest(mod, vcovHC(mod))

#' You can use the tidy command from the broom package to return
#' a data frame 
tidy(coeftest(mod, vcovHC(mod)))

#' The Breusch-Pagan test is a test for heteroskedasticity
#' The null hypothesis is that there is NOT heteroskedasticity.
#' The alternative hypothesis is that there is heteroskedastiticy.
bptest(mod)
