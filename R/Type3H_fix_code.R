#' Type 3 FR (Holling) with prey replacement
#'
#' Contains Stan function of the same name as character string.
#' Number of eaten prey:
#' \deqn{N_E=\frac{bN^2}{1+bhN^2}PT}{N_E=bN^2 PT/(1+bhN^2)}
#'
#' Usage in brms formula:\cr\cr
#' \verb{~ Type3H_fix(N, P, Time, b, h)}\cr\cr
#' \verb{N    } initial number of prey \cr
#' \verb{P    } number of predators \cr
#' \verb{Time } duration of the experiment \cr
#' \verb{b    } attack coefficient \cr
#' \verb{h    } handling time

#' @return Number of eaten prey
#' @export
Type3H_fix_code = "
// prediction
real Type3H_fix(real N, real P, real Time, real b, real h){
  return(b*N*N*P*Time/(1.0+b*h*N*N));
}
"
