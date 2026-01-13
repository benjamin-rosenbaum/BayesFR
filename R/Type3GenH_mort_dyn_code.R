#' Functional response models with prey mortality
#'
#' Contains Stan function of the same name as character string. Uses numerical
#' solution of the generalized type 3 ODE with an additional mortality term
#' \deqn{\frac{dN}{dt}=-\frac{bN^{1+q}}{1+bhN^{1+q}}P-mN}{dN/dt=-bN^(1+q) P/(1+bhN^(1+q))-mN}
#' to compute number of eaten / dead prey. It can compute predictions for feeding
#' trials (observations with \verb{P>0}) and also control treatments (\verb{P=0}),
#' for which the ODE reduces to
#' \deqn{\frac{dN}{dt}=-mN}{dN/dt=-mN}
#' The exponent \verb{q} can be fixed for fitting type 2 responses (\verb{q=0}) or
#' type 3 responses (\verb{q=1}), which both do not have an analytical solution
#' with additional and prey mortality have to be predicted using the ODE.
#'
#' Usage in brms formula:\cr\cr
#' \verb{~ Type3GenH_dyn(N, P, Time, b, h, q, m)}\cr\cr
#' \verb{N    } initial number of prey \cr
#' \verb{P    } number of predators \cr
#' \verb{Time } duration of the experiment \cr
#' \verb{b    } attack coefficient \cr
#' \verb{q    } attack exponent \cr
#' \verb{h    } handling time \cr
#' \verb{m    } mortality rate
#'
#' Type 2 functional response: \cr\cr
#' \verb{~ Type3GenH_dyn(N, P, Time, a, h, 0, m)}\cr\cr
#' Type 3 functional response: \cr\cr
#' \verb{~ Type3GenH_dyn(N, P, Time, b, h, 1, m)}

#' @return Number of eaten prey
#' @export
Type3GenH_mort_dyn_code = "
// ODE function
vector TypeGenODE(real t, vector y, vector theta){
  vector[1] dydt;
  if(y[1]<1e-8){
    dydt[1] = 0.0;
  } else {
    dydt[1] = -theta[1]*y[1]^theta[3]/(1.0+theta[1]*theta[2]*y[1]^theta[3])*theta[4]-theta[5]*y[1];
  }
  return dydt;
}
// prediction
real Type3GenH_mort_dyn(real N, real P, real Time, real b, real h, real q, real m){
  array[1] vector[1]  y;
  vector[5] theta;
  theta[1] = b;
  theta[2] = h;
  theta[3] = 1.0+q;
  theta[4] = P;
  theta[5] = m;
  y = ode_rk45(TypeGenODE, [N]', 0.0, {Time}, theta);
  return(N-y[1][1]);
}
"
