#' Visualisation de la règle de Rent
#' @param G vecteur de blocs logiques
#' @param P vecteur de broches observées
#' @param fit objet retourné par rent_fit
#' @export
rent_plot <- function(G, P, fit) {
  plot(log(G), log(P), main="Règle de Rent", xlab="log(G)", ylab="log(P)")
  abline(fit$model, col="red")
}
