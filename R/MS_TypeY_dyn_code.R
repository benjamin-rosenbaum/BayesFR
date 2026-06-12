#' Yodzis FR without replacement
#'
#' Contains Stan function of the same name as character string. Uses numerical
#' solution of the 2-prey ODE
#' \deqn{\frac{dN_1}{dt}=-\frac{w_1a_1N_1^{1+r}}{(w_1N_1^r+(1-w_1)N_2^r)+w_1a_1h_1N_1^{1+r}+(1-w_1)a_2h_2N_2^{1+r}}P}{dN1/dt=-w1a1N1^(1+r) P/((w1N1^r+(1+w1)N2^r)+w1a1h1N1^(1+r)+(1-w1)a2h2N2^(1+r)))}
#' \deqn{\frac{dN_2}{dt}=-\frac{(1-w_1)a_2N_2^{1+r}}{(w_1N_1^r+(1-w_1)N_2^r)+w_1a_1h_1N_1^{1+r}+(1-w_1)a_2h_2N_2^{1+r}}P}{dN2/dt=-w1a2N2^(1+r) P/((w1N1^r+(1+w1)N2^r)+w1a1h1N1^(1+r)+(1-w1)a2h2N2^(1+r)))}
#' to compute number of eaten prey.
#'
#' Usage in brms formula:\cr\cr
#' \verb{~ MS_TypeY_dyn(N0, N0.alt, ID, P, Time, a1, a2, h1, h2, w1, r)}\cr\cr
#' \verb{N0    } initial number of focal prey species \cr
#' \verb{N0.alt} initial number of alternative prey species \cr
#' \verb{ID    } ID of focal species (1 or 2) \cr
#' \verb{P     } number of predators \cr
#' \verb{Time  } duration of the experiment \cr
#' \verb{a1    } attack rate for prey species 1 \cr
#' \verb{a2    } attack rate for prey species 2 \cr
#' \verb{h1    } handling time for prey species 1 \cr
#' \verb{h2    } handling time for prey species 2 \cr
#' \verb{w1    } preference weight for species 1 in multi-prey \cr
#' \verb{r     } additional exponent in multi-prey only \cr
#'
#' Requires the data to be in a specific "long" format. Use the function
#' \verb{convert_2sp_to_long()} to transform from a dataframe with columns
#' N01, N02, NE1, NE2

#' @return Number of eaten prey
#' @export
MS_TypeY_dyn_code = "
// ODE function
vector TypeYODE_multi(real t, vector y,  vector theta){
  vector[2] dydt;
  vector[2] yr = [y[1]^theta[6], y[2]^theta[6]]';
  vector[2] y1r = [y[1]*yr[1], y[2]*yr[2]]';
  real denominator = theta[5]*yr[1] + (1.0-theta[5])*yr[2] +
         theta[5] * theta[1]*theta[3]*y1r[1] +
    (1.0-theta[5])* theta[2]*theta[4]*y1r[2];
  if(y[1]<1e-8){
    dydt[1] = 0.0;
  } else {
    dydt[1] = -theta[5]*theta[1]*y1r[1]*theta[7]/denominator;
  }
  if(y[2]<1e-8){
    dydt[2] = 0.0;
  } else {
    dydt[2] = -(1-theta[5])*theta[2]*y1r[2]*theta[7]/denominator;
  }
  return dydt;
}
// prediction
real MS_TypeY_dyn(real N0, real N0alt, int ID, real P, real Time, real a1, real a2, real h1, real h2, real w1, real r){
  array[1] vector[2]  y;
  vector[7] theta;
  if(ID == 1){
    theta = [a1, a2, h1, h2, w1,     r, P]';
  } else {
    theta = [a2, a1, h2, h1, 1.0-w1, r, P]';
  }
  y = ode_rk45(TypeYODE_multi, [N0,N0alt]', 0.0, {Time}, theta);
  return(N0-y[1][1]);
}
"
