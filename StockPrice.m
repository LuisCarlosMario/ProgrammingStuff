function [T,S] = StockPrice(S0,r,q, C, G, M, k, eta, lambda, y0, t, dt)

    [T,Z] = VGSV2(C, G, M, k, eta, lambda, y0, t, dt);
    
    m = cummean(exp(Z));

    S = S0*((exp((r-q).*T)  + Z)./m);

end


function [T,X] = VGSV2(C, G, M, k, eta, lambda, y0, t, dt)
    
    %[T,y,Y] = CIRProcess3(y0, k,eta , lambda, t, dt);
    T=0:dt:t;
    Y=T;
    G1 = GammaProcessSV(C, M, Y);
    G2 = GammaProcessSV(C, G, Y);
    
    X = G1 - G2;
    
end

function CM = cummean(V)
    
    n = length (V);
    CM = zeros([1,n]);
    for i = 1:n
        CM(i) = mean(V(1:i));
    end
    
end
