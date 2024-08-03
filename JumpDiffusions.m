function [T,X] = JumpDiffusions(b,sig,lambda, mean2, vol2, t, n)

    N=poissrnd(t * lambda);
    
    dt=t/n;        
    vol = sig*sqrt(dt);
    mean = b*dt;
    T=0:dt:t;
    X=zeros(1,n+1);
    V = normrnd(mean,vol,[1,n]);
    NV = normrnd(mean2,vol2,[1,N]);
    %Probably using the same seed
    

    T=0:dt:t;
    tau = sort(t*rand([1,N]));
    tau(N+1) = Inf;
    X=zeros(1,n+1);
    j=1;
    
    for i = 1:n
        X(i+1) = X(i) + V(i);
        if  dt*(i-1) >= tau(j)
            X(i+1) = X(i)+NV(j);
            j=j+1;
        end
    end
end