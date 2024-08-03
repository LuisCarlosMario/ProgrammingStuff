function [K,COP] = CallOptionVG(C, G, M, S0, Kmin, dK, Kmax, r ,q, t, dt, ite)
    
    K = Kmin:dK:Kmax;
    V = zeros([ite,1]);
    
    for i = 1:ite
        [T,S] = StockPriceVG(C, G, M, S0, r ,q, t, dt);
        V(i) = S(end);
    end
    
    M = (V - K);
    M(M<0) = 0;
    
    COP = exp(-r*t)*mean(M);
end
