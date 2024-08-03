function [T,y,Y] = CIRProcess(y0, k ,eta, lambda, t, dt)
    
    T=0:dt:t;
    n=length(T);
    y = zeros([1,n]);
    y(1) = y0;
    V = normrnd(0,sqrt(dt),[1,n-1]);
    
    for i = 1:n-1
        if (0 < y(i) + k*(eta-y(i))*dt + lambda*sqrt(y(i))*V(i))
            y(i+1) = y(i) + k*(eta-y(i))*dt + lambda*sqrt(y(i))*V(i);
        else
            y(i+1) = 0;
        end
    end
    Y=cumsum(y)*dt;
end