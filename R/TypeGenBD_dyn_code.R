#' Functional response models with predator interference
#'
#' Contains Stan function of the same name as character string. Uses numerical
#' solution of the \bold{(generalized) Beddington-DeAngelis} model
#' \deqn{\frac{dN}{dt}=-\frac{bN^{1+q}}{1+c(P-1)+bhN^{1+q}}P}{dN/dt=-bN^(1+q)P/(1+c(P-1)+bhN^{1+q})}
#' to compute number of eaten prey. Predator interference affects attack rates only.
#'
#' The exponent \verb{q} can be fixed for fitting type 2 responses (\verb{q=0}) or
#' type 3 responses (\verb{q=1}).
#'
#' Usage in brms formula:\cr\cr
#' \verb{~ TypeGenBD_dyn(N, P, Time, b, h, q, c)}\cr\cr
#' \verb{N    } initial number of prey \cr
#' \verb{P    } number of predators \cr
#' \verb{Time } duration of the experiment \cr
#' \verb{b    } attack coefficient for P=1 \cr
#' \verb{q    } attack exponent \cr
#' \verb{h    } handling time \cr
#' \verb{c    } predator interference coefficient
#'
#' Type 2 functional response: \cr\cr
#' \verb{~ TypeGenBD_dyn(N, P, Time, a, h, 0, c)}\cr\cr
#' Type 3 functional response: \cr\cr
#' \verb{~ TypeGenBD_dyn(N, P, Time, b, h, 1, c)}

#' @return Number of eaten prey
#' @export
TypeGenBD_dyn_code = "
// ODE function
vector TypeGenBDODE(real t, vector y, vector theta){
  vector[1] dydt;
  real bNq = theta[1]*y[1]^theta[3];
  if(y[1]<1e-8){
    dydt[1] = 0.0;
  } else {
    dydt[1] = -bNq*theta[4] / ( 1.0+theta[5]*(theta[4]-1.0) + bNq*theta[2] );
  }
  return dydt;
}
// prediction
real TypeGenBD_dyn(real N, real P, real Time, real b, real h, real q, real c){
  array[1] vector[1]  y;
  vector[5] theta;
  theta[1] = b;
  theta[2] = h;
  theta[3] = 1.0+q;
  theta[4] = P;
  theta[5] = c;
  y = ode_rk45(TypeGenBDODE, [N]', 0.0, {Time}, theta);
  return(N-y[1][1]);
}
"
