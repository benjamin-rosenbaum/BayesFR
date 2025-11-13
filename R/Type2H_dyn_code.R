#' Type 2 FR (Holling) with prey depletion
#'
#' Contains Stan function of the same name as character string. Uses analytical
#' solution (Rogers random predator equation with LambertW function) of the ODE
#' \deqn{\frac{dN}{dt}=-\frac{aN}{1+ahN}P}{dN/dt=-aNP/(1+ahN)}
#' to compute number of eaten prey.
#'
#' Usage in brms formula:\cr\cr
#' \verb{~ Type2H_dyn(N, a, h, P, Time)}\cr\cr
#' \verb{N    } initial number of prey \cr
#' \verb{a    } attack rate \cr
#' \verb{h    } handling time \cr
#' \verb{P    } number of predators \cr
#' \verb{Time } duration of the experiment

#' @return Number of eaten prey
#' @export
Type2H_dyn_code = "
// prediction
real Type2H_dyn(real N, real a, real h, real P, real Time){
  return(N-lambert_w0(a*h*N*exp(a*(h*N-P*Time)))/(a*h));
}
"
