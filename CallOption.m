function [T,S,C] = CallOption(K, S0, r, q, C, G, M, k, eta, lambda, y0, t, dt)
    
    [T,S] = StockPrice(S0,r,q, C, G, M, k, eta, lambda, y0, t, dt);

    C = S - K;
    C(C<0) = 0;
end