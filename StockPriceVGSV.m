function [T,S] = StockPriceVGSV(C, G, M, k ,eta, lambda, y0, S0, r ,q, t, dt)
    
    [T,X] =  VarianceGammaSV(C, G, M, k, eta, lambda, y0, t, dt);
    m = CharacteristicFunctionVGSV(-i, C, G, M, k ,eta, lambda, y0, 1).^T;
    
    S = S0*exp((r-q)*T+ X) ./ m;
end
