function [T,PP] = PoissonProcess(t,lambda)
    T=0;
    PP=0;
    i = 2;
    while T(end) < t
        e = -log(rand) / lambda;
        T(i) = T(i-1) + e;
        PP(i) = PP(i-1)+1;
        i=i+1;
    end
    
end

function [T,PP] = PoissonProcess(t,lambda, n)
    dt=t/n; 
    T=0:dt:t;
    Tjump=0;
    PP=
    PP=0;
    i = 2;
    while Tjump < t
        e = -log(rand) / lambda;
        Tjump = e
        T(i) = T(i-1) + e;
        PP(i) = PP(i-1)+1;
        i=i+1;
    end
    
end