#' Visualize Rent's Rule and the Fitted Model
#'
#' This function produces a log–log plot of the observed data \code{(G, P)}
#' together with the fitted Rent's rule model obtained from \code{rent_fit()}.
#' It provides a quick visual assessment of how well the estimated parameters
#' \eqn{k} and \eqn{p} capture the empirical relationship between logic blocks
#' and external pins.
#'
#' The plot displays:
#' \itemize{
#'   \item the observed data points in the \eqn{\log(G)}–\eqn{\log(P)} space,
#'   \item the regression line corresponding to the fitted model.
#' }
#'
#' This visualization is useful for:
#' \itemize{
#'   \item validating the linearity assumption of the log–log transformation,
#'   \item checking the goodness of fit,
#'   \item detecting potential outliers or deviations from Rent's rule.
#' }
#'
#' @param G Numeric vector. Number of logic blocks in the circuit.
#' @param P Numeric vector. Observed number of external pins.
#' @param fit A list returned by \code{rent_fit()}, containing the estimated
#'   parameters and the underlying linear model.
#'
#' @return A base R plot is produced as a side effect. The function returns
#'   \code{NULL} invisibly.
#'
#' @examples
#' G <- c(1e4, 2e4, 5e4, 1e5)
#' P <- c(800, 1200, 2000, 3000)
#' fit <- rent_fit(G, P)
#' rent_plot(G, P, fit)
#'
#' @export
rent_plot <- function(G, P, fit) {
  plot(log(G), log(P), main = "Rent's Rule",
       xlab = "log(G)", ylab = "log(P)")
  abline(fit$model, col = "red")
}
