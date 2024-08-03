function [T,S] = VarianceGammaStockPrice(C, G, M, S0, r ,q, t, dt)
    
    [T,X] = VarianceGamma3(C, G, M, t, dt);
    m = (VGCharacteristicFunction(-i, C, G, M))^t;
    
    S = S0*exp((r-q)*T+ X) / m;
end
