function C = BlackScholesSolution(K, S0, r, q, t, sig)
    
    d1 = (log(S0./K) + (r-q+(sig.^2)/2)*t) ./(sig.*sqrt(t));
    d2 = (log(S0./K) + (r-q-(1/2)*sig.^2)*t)./(sig.*sqrt(t));
    C = S0.*exp(-q*t) .* normcdf(d1) - K.*exp(-r*t).*normcdf(d2);

end