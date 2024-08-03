function [Delta, Gamma, Rho, Theta] = BlackScholesGreeks(K, S0, r, q, t, sig)
    
    d1 = (log(S0./K) + (r-q+(sig.^2)/2)*t) ./(sig.*sqrt(t));
    d2 = (log(S0./K) + (r-q-(1/2)*sig.^2)*t)./(sig.*sqrt(t));
    Delta = normcdf(d1);
    Gamma = normpdf(d1)./(S0.*sig.*sqrt(t));
    Rho = K.*t.*exp(-r.*t).*normcdf(d2);
    Theta = - (S0.*normpdf(d1).*sig)./(2*sqrt(t)) - r.*K.*exp(-r.*t).*normcdf(d2);

end