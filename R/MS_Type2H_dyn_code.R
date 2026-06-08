#' Type 2 multi-species FR without replament
#' 
#' Contains Stan function of the same name as character string. Uses numerical
#' solution of the 2-prey ODE
#' \deqn{\frac{dN_1}{dt}=-\frac{a_1N_1}{1+a_1h_1N_1+a_2h_2N_2}P}{dN1/dt=-a1N1 P/(1+a1h1N1+a2h2N2))}
#' \deqn{\frac{dN_2}{dt}=-\frac{a_2N_2}{1+a_1h_1N_1+a_2h_2N_2}P}{dN2/dt=-a2N2 P/(1+a1h1N1+a2h2N2))}
#' to compute number of eaten prey.
#' 
#' Usage in brms formula:\cr\cr
#' \verb{~ MS_Type2H_dyn(N0, N0.alt, ID, P, Time, a1, a2, h1, h2)}\cr\cr
#' \verb{N0    } initial number of focal prey species \cr
#' \verb{N0.alt} initial number of alternative prey species \cr
#' \verb{ID    } ID of focal species (1 or 2) \cr
#' \verb{P     } number of predators \cr
#' \verb{Time  } duration of the experiment \cr
#' \verb{a1    } attack rate for prey species 1 \cr
#' \verb{a2    } attack rate for prey species 2 \cr
#' \verb{h1    } handling time for prey species 1 \cr
#' \verb{h2    } handling time for prey species 2 \cr
#' 
#' Requires the data to be in a specific "long" format. Use the function 
#' \verb{convert_2sp_to_long()} to transform from a dataframe with columns 
#' N01, N02, NE1, NE2

#' @return Number of eaten prey
#' @export
MS_Type2H_dyn_code = " 
// ODE function
vector Type2HODE_multi(real t, vector y,  vector theta){
  vector[2] dydt;
  real denominator = 1.0 + theta[1]*theta[3]*y[1] + theta[2]*theta[4]*y[2];
  if(y[1]<1e-8){
    dydt[1] = 0.0;
  } else {
    dydt[1] = -theta[1]*y[1]*theta[5]/denominator;
  }
  if(y[2]<1e-8){
    dydt[2] = 0.0;
  } else {
    dydt[2] = -theta[2]*y[2]*theta[5]/denominator;
  }
  return dydt;
}
// prediction
real MS_Type2H_dyn(real N0, real N0alt, int ID, real P, real Time, real a1, real a2, real h1, real h2){
  array[1] vector[2]  y;
  vector[5] theta;
  if(ID == 1){
    theta = [a1, a2, h1, h2, P]';
  } else {
    theta = [a2, a1, h2, h1, P]';
  }
  y = ode_rk45(Type2HODE_multi, [N0,N0alt]', 0.0, {Time}, theta);
  return(N0-y[1][1]); 
}
"