function BOP = BarrierOptionVGSV(C, G, M, k, eta, lambda, y0, S0, K, H, r ,q, t, dt, ite)
    
    n = length(H);
    V = zeros([ite,n]);
    
    for i = 1:ite
        [T,S] = StockPriceVGSV(C, G, M, k ,eta, lambda, y0, S0, r ,q, t, dt);
        
        for j = 1:n
            if (S-H(j) < 0)
                V(i,j) = 0;
            else
                V(i,j) = S(end);
            end
        end
    end
    
    M = V - K;
    M(M<0) = 0;
    
    BOP = exp(-r*t)*mean(M);
end