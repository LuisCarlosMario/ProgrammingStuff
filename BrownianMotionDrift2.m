function [T,X] = BrownianMotionDrift2(b,sig,t,dt)
    
    % volatility
    vol = sig*sqrt(dt);
    % mean
    mean = b*dt;
    % time grid
    T=0:dt:t;
    n = length(T);
    % each B_i - B_(i-1)
    V = normrnd(mean,vol,[1,n-1]);
    
    % vector with all B_i's
    X = [0,cumsum(V)];
end