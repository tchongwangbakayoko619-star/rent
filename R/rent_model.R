#' Compute the Number of External Pins Using Rent's Rule
#'
#' This function calculates the expected number of external pins required
#' for a digital circuit based on **Rent's rule**, a widely used empirical
#' model in microelectronics and VLSI design.
#'
#' Rent's rule expresses the relationship between the number of logic blocks
#' in a system and the number of external connections (pins) needed to
#' interface with the rest of the circuit. It is commonly used to estimate
#' interconnection complexity, guide packaging decisions, and support early
#' architectural planning.
#'
#' The rule is defined as:
#' \deqn{P = k \cdot G^{p}}
#' where:
#' \itemize{
#'   \item \eqn{P} is the number of external pins,
#'   \item \eqn{k} is a proportionality constant related to the architecture,
#'   \item \eqn{G} is the number of logic blocks,
#'   \item \eqn{p} is Rent's exponent, typically between 0 and 1.
#' }
#'
#' @param G Numeric vector. Number of logic blocks in the circuit.
#' @param k Numeric scalar. Proportionality constant of Rent's rule.
#' @param p Numeric scalar. Rent's exponent, controlling interconnection complexity.
#'
#' @return A numeric vector giving the estimated number of external pins
#'   corresponding to each value of \code{G}.
#'
#' @examples
#' # Basic usage
#' rent_pins(G = 10000, k = 4.5, p = 0.6)
#'
#' # Vectorized input
#' rent_pins(G = c(1e4, 2e4, 5e4), k = 4.5, p = 0.6)
#'
#' @export
rent_pins <- function(G, k, p) {
  k * G^p
}
