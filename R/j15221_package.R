#' The 'j15221' package.
#'
#' @docType package
#' @name    j15221_package
#' @aliases j15221
#' @useDynLib j15221, .registration = TRUE
#'
#' @import methods
#' @import Rcpp
#' @import rstantools
#' @import stats

#' @importFrom rstan sampling extract stanc rstan_options traceplot stan_rhat
#' @importFrom grDevices colors
#' @importFrom graphics axis box legend lines par plot points text arrows grid rect
#' @importFrom parallel detectCores
#' @importFrom utils as.roman
#'
#' @description Cpp and STAN functions for J15221 missing data analysis and
#'     hypothesis testing
#'
#' @references
#' Stan Development Team (2018). RStan: the R interface to Stan. R package version 2.18.2. http://mc-stan.org
#'
NULL
