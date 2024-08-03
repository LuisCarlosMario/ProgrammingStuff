function [R,RwC] = PortfolioReturnVG2(C, G, M, S0, K, r ,q, t, dt, ite, p)
    
    [K,COP] = CallOptionVG2(C, G, M, S0, K, r ,q, t, dt, ite);
    IV = p*S0 + (1 - p)*COP;

    V = zeros([ite,1]);

    for i = 1:ite
        [T,S] = StockPriceVG(C, G, M, S0, r ,q, t, dt);
        V(i) = S(end);
    end    
    
    R = exp(-r*t)*mean(V)/S0;
    
    M = (V - K);
    M(M<0) = 0;
    W = p*V +(1-p)*M;
    RwC = exp(-r*t)*mean(W)/IV;
    
end