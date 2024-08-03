function [T,X] = BrownianMotionDrift(b,sig,t,dt)
    
    vol = sig*sqrt(dt);
    mean = b*dt;
    T=0:dt:t;
    n = length(T);

    V = normrnd(mean,vol,[1,n-1]);
    
    X = [0,cumsum(V)];
end