#' Type 2 FR (Holling) with prey replacement
#'
#' Contains Stan function of the same name as character string.
#' Number of eaten prey:
#' \deqn{N_E=\frac{aN}{1+ahN}PT}{N_E=aNPT/(1+ahN)}
#'
#' Usage in brms formula:\cr\cr
#' \verb{~ Type2H_fix(N, a, h, P, Time)}\cr\cr
#' \verb{N    } initial number of prey \cr
#' \verb{a    } attack rate \cr
#' \verb{h    } handling time \cr
#' \verb{P    } number of predators \cr
#' \verb{Time } duration of the experiment

#' @return Number of eaten prey
#' @export
Type2H_fix_code = "
// prediction
real Type2H_fix(real N, real a, real h, real P, real Time){
  return(a*N*P*Time/(1.0+a*h*N));
}
"

