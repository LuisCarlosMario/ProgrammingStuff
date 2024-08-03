function CP = CallOptionPriceMonteCarlo(C, G, M, S0, r, q, t, K, n, iterations)
    
    m = VGCharacteristicFunction(-i, C, G, M);

    u = zeros([1,iterations]);
    for j = 1:iterations
        [tau,X] = VarianceGamma2(C, G, M, t, n);
        S = S0*exp((r-q)*t + X(end))/m;
        u(j) = S - K;
    end
    
    u(u<0)=0;
    CP = mean(u);
end

