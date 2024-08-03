function [NN,K,TM,COP,s] = CallOptionVGRevengeStock(C, G, M, S0, K, r ,q, T, dt, ite)
    
    %V = zeros(ite,length(S0));
    MM = zeros(ite,length(S0));
    %SS = zeros(length(K),length(T),ite);
    for i = 1:ite
        [X,TM,S1,s,m] = StockPriceVGRevenge(C, G, M, S0, r ,q, T, dt);
        MM(i,:) = (S1(end,:) - K);
        %S1(end)
    end
    NN = MM;
    MM(MM<0) = 0;
    
    COP = exp(-r*T)*mean(MM);
end
