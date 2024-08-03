function [T,PP] = CompoundPoissonNormal(t,lambda, n, mean, vol)
    N=poissrnd(t*lambda);
   
    dt=t/n;
    T=0:dt:t;
    tau = sort(t*rand([1,N]));
    tau(N+1) = Inf;
    NV = normrnd(mean,vol,[1,N]);
    PP=zeros(1,n+1);
    j=1;
    
    for i = 2:n+1
        if  dt*(i-1) < tau(j)
            PP(i) = PP(i-1);
        else
            PP(i) = PP(i-1) + NV(j);
            j=j+1;
        end
    end
end