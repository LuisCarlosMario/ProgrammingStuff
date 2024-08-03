function [T,S] = StockPriceBM(S0, r ,q, sig, t, dt)
    
    [T,X] = BrownianMotionDrift(r - q, sig, t, dt);
    
    S = S0*exp(X);
end
