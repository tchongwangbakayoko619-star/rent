#' Estimate Rent's Rule Parameters (k and p)
#'
#' This function estimates the two parameters of **Rent's rule** — the
#' proportionality constant \eqn{k} and the Rent exponent \eqn{p} — from
#' observed data. Rent's rule models the relationship between the number of
#' logic blocks in a circuit and the number of external pins required:
#'
#' \deqn{P = k \cdot G^{p}}
#'
#' Taking the logarithm of both variables yields a linear relationship:
#'
#' \deqn{\log(P) = \log(k) + p \cdot \log(G)}
#'
#' This function fits this linearized form using ordinary least squares
#' regression. The slope of the regression corresponds to the Rent exponent
#' \eqn{p}, and the intercept corresponds to \eqn{\log(k)}, from which
#' \eqn{k} is recovered by exponentiation.
#'
#' @param G Numeric vector. Number of logic blocks in the circuit.
#'   Must be strictly positive.
#' @param P Numeric vector. Observed number of external pins corresponding
#'   to each value of \code{G}. Must be strictly positive.
#'
#' @return A list containing:
#' \describe{
#'   \item{k}{Estimated proportionality constant of Rent's rule.}
#'   \item{p}{Estimated Rent exponent, describing interconnection complexity.}
#'   \item{model}{The fitted linear model object returned by \code{lm()}.}
#' }
#'
#' @details
#' The estimation assumes:
#' \itemize{
#'   \item a power-law relationship between \code{G} and \code{P},
#'   \item log-normal noise in the observations,
#'   \item linearity of \eqn{\log(P)} with respect to \eqn{\log(G)}.
#' }
#'
#' The function is vectorized and will estimate parameters from all provided
#' data points simultaneously.
#'
#' @examples
#' # Example with synthetic data
#' G <- c(1e4, 2e4, 5e4, 1e5)
#' P <- c(800, 1200, 2000, 3000)
#' rent_fit(G, P)
#'
#' @export
rent_fit <- function(G, P) {
  fit <- lm(log(P) ~ log(G))
  p <- coef(fit)[2]
  k <- exp(coef(fit)[1])
  list(k = k, p = p, model = fit)
}
