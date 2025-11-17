#' Type 1 FR with prey replacement
#'
#' Contains Stan function of the same name as character string.
#' Number of eaten prey:
#' \deqn{N_E=aNPT}{N_E=aNPT}
#'
#' Usage in brms formula:\cr\cr
#' \verb{~ Type1_fix(N, P, Time, a)}\cr\cr
#' \verb{N    } initial number of prey \cr
#' \verb{P    } number of predators \cr
#' \verb{Time } duration of the experiment \cr
#' \verb{a    } attack rate

#' @return Number of eaten prey
#' @export
Type1_fix_code = "
// prediction
real Type1_fix(real N, real P, real Time, real a){
  return(a*N*P*Time)
}
"
