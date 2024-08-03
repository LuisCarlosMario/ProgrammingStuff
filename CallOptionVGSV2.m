function [K,COP] = CallOptionVGSV2(C, G, M, k, eta, lambda, y0, S0, K, r ,q, t, dt, ite)
    
    V = zeros([ite,1]);
    
    for i = 1:ite
        [T,S] = StockPriceVGSV(C, G, M, k ,eta, lambda, y0, S0, r ,q, t, dt);
        V(i) = S(end);
    end
    
    M = (V - K);
    M(M<0) = 0;
    
    COP = exp(-r*t)*mean(M);
end
