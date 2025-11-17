#' Type 3 FR (Holling) with prey depletion
#'
#' Contains Stan function of the same name as character string. Uses analytical
#' solution (quadratic equation) of the ODE
#' \deqn{\frac{dN}{dt}=-\frac{bN^2}{1+bhN^2}P}{dN/dt=-bN^2 P/(1+bhN^2)}
#' to compute number of eaten prey.
#'
#' Usage in brms formula:\cr\cr
#' \verb{~ Type3H_dyn(N, P, Time, b, h)}\cr\cr
#' \verb{N    } initial number of prey \cr
#' \verb{P    } number of predators \cr
#' \verb{Time } duration of the experiment \cr
#' \verb{b    } attack coefficient \cr
#' \verb{h    } handling time

#' @return Number of eaten prey
#' @export
Type3H_dyn_code = "
// prediction
real Type3H_dyn(real N, real P, real Time, real b, real h){
  real p = ((-b*h*N*N-b*P*Time*N-1.0)/(b*h*N))/2.0;
  real q = P*Time*N/h;
  return(-p-sqrt(p*p-q));
}
"
