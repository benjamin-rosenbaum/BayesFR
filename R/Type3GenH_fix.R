#' Generalized type 3 FR (Holling) with prey replacement
#'
#' Contains Stan function of the same name as character string.
#' Number of eaten prey:
#' \deqn{N_E=\frac{bN^{1+q}}{1+bhN^{1+q}}PT}{N_E=bN^(1+q) PT/(1+bhN^(1+q))}
#'
#' Usage in brms formula:\cr\cr
#' \verb{~ Type3GenH_fix(N, b, h, q, P, Time)}\cr\cr
#' \verb{N    } initial number of prey \cr
#' \verb{b    } attack coefficient \cr
#' \verb{q    } attack exponent \cr
#' \verb{h    } handling time \cr
#' \verb{P    } number of predators \cr
#' \verb{Time } duration of the experiment

#' @return Number of eaten prey
#' @export
Type3GenH_fix = "
// prediction
real Type3GenH_fix(real N, real b, real h, real q, real P, real Time){
  return(b*N^(1.0+q)*P*Time/(1.0+b*h*N^(1.0+q)));
}
"
