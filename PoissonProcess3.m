function [T,PP] = PoissonProcess3(t,lambda, n)
    N=poissrnd(t*lambda);
    
    dt=t/n;
    T=0:dt:t;
    tau = sort(t*rand([1,N]));
    tau(N+1) = Inf;
    PP=zeros(1,n+1);
    j=1;
    
    for i = 2:n+1
        if  dt*(i-1) < tau(j)
            PP(i) = PP(i-1);
        else
            PP(i) = PP(i-1) + 1;
            j=j+1;
        end
    end
end