#' Functional response models with predator interference
#'
#' Contains Stan function of the same name as character string. Uses analytical
#' solution of the \bold{Crowley-Martin} model
#' \deqn{\frac{dN}{dt}=-\frac{aN}{(1+ahN)(1+c(P-1))}P}{dN/dt=-aNP/((1+ahN)(1+c(P-1)))}
#' to compute number of eaten prey. Rogers random predator equation with LambertW
#' function is used with modified attack rates and handling times. Predator
#' interference affects attack rates and handling times, both.
#'
#' Usage in brms formula:\cr\cr
#' \verb{~ Type2CM_dyn(N, P, Time, a, h, c)}\cr\cr
#' \verb{N    } initial number of prey \cr
#' \verb{P    } number of predators \cr
#' \verb{Time } duration of the experiment \cr
#' \verb{a    } attack rate for P=1\cr
#' \verb{h    } handling time \cr
#' \verb{c    } predator interference coefficient
#'
#' @return Number of eaten prey
#' @export
Type2CM_dyn_code = "
// prediction
real Type2CM_dyn(real N, real P, real Time, real a, real h, real c){
  real a_new = a/(1.0+c*(P-1.0));
  real h_new = h*(1.0+c*(P-1.0));
  return(N-lambert_w0(a_new*h_new*N*exp(a_new*(h_new*N-P*Time)))/(a_new*h_new));
}
"
