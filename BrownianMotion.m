function [T,W] = BrownianMotion(t, n)
    
    dt=t/n;
    vol = sqrt(dt);
    T=0:dt:t;
    W=zeros(1,n+1);
    V=normrnd(0,vol,[1,n]);
    
    for i = 1:n
        W(i+1) = W(i) + V(i);
    end
    
end