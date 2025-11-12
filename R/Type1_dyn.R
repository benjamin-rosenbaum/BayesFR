#' Type 1 FR with prey depletion
#'
#' Contains Stan function of the same name as character string. Uses analytical
#' solution (exponential function) of the ODE
#' \deqn{\frac{dN}{dt}=-aNP}{dN/dt=-aNP}
#' to compute number of eaten prey.
#'
#' Usage in brms formula:\cr\cr
#' \verb{~ Type1_dyn(N, a, P, Time)}\cr\cr
#' \verb{N    } initial number of prey \cr
#' \verb{a    } attack rate \cr
#' \verb{P    } number of predators \cr
#' \verb{Time } duration of the experiment

#' @return Number of eaten prey
#' @export
Type1_dyn = "
// prediction
real Type1_dyn(real N, real a, real P, real Time){
  return(N-N*exp(-a*P*Time));
}
"
