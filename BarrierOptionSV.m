function BOP = BarrierOptionSV(C, G, M, S0, Kmin, dK, Kmax, H, r ,q, t, dt, ite)
    
    K = Kmin:dK:Kmax;
    V = zeros([ite,1]);
    
    for i = 1:ite
        [T,S] = VarianceGammaStockPrice(C, G, M, S0, r ,q, t, dt);
        if (S-H < 0)
            V(i) =0;
        else
            V(i) = S(end);
        end
    end
    
    M = V - K;
    M(M<0) = 0;
    
    BOP = mean(M);
end