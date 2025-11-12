#' Generalized type 3 FR (Holling) with prey depletion
#'
#' Contains Stan function of the same name as character string. Uses numerical
#' solution of the ODE
#' \deqn{\frac{dN}{dt}=-\frac{bN^{1+q}}{1+bhN^{1+q}}P}{dN/dt=-bN^(1+q) P/(1+bhN^(1+q))}
#' to compute number of eaten prey.
#'
#' Usage in brms formula:\cr\cr
#' \verb{~ Type3GenH_dyn(N, b, h, q, P, Time)}\cr\cr
#' \verb{N    } initial number of prey \cr
#' \verb{b    } attack coefficient \cr
#' \verb{q    } attack exponent \cr
#' \verb{h    } handling time \cr
#' \verb{P    } number of predators \cr
#' \verb{Time } duration of the experiment

#' @return Number of eaten prey
#' @export
Type3GenH_dyn = "
// ODE function
vector TypeGenODE(real t, vector y, vector theta){
  vector[1] dydt;
  if(y[1]<1e-8){
    dydt[1] = 0.0;
  } else {
    dydt[1] = -theta[1]*y[1]^theta[3]/(1.0+theta[1]*theta[2]*y[1]^theta[3])*theta[4];
  }
  return dydt;
}
// prediction
real Type3GenH_dyn(real N, real b, real h, real q, real P, real Time){
  array[1] vector[1]  y;
  vector[4] theta;
  theta[1] = b;
  theta[2] = h;
  theta[3] = 1.0+q;
  theta[4] = P;
  y = ode_rk45(TypeGenODE, [N]', 0.0, {Time}, theta);
  return(N-y[1][1]);
}
"
