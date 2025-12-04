#' Calcul du nombre de broches selon la règle de Rent
#' @param G nombre de blocs logiques
#' @param k constante de proportionnalité
#' @param p exposant de Rent
#' @return nombre de broches externes
#' @export
rent_pins <- function(G, k, p) {
  k * G^p
}
