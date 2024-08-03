function [T,W] = BrownianMotion2(t, dt)
    
    
    vol = sqrt(dt);
    T=0:dt:t;
    n=length(T);
    W=zeros(1,n);
    V=normrnd(0,vol,[1,n]);
    
    for i = 2:n
        W(i) = W(i-1) + V(i);
    end
    
end