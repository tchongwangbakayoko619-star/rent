#' Estimation des paramètres de Rent (k et p)
#' @param G vecteur de blocs logiques
#' @param P vecteur de broches observées
#' @return liste avec k et p estimés
#' @export
rent_fit <- function(G, P) {
  fit <- lm(log(P) ~ log(G))
  p <- coef(fit)[2]
  k <- exp(coef(fit)[1])
  list(k = k, p = p, model = fit)
}
