function [T,y,Y] = CIRProcess2(y0, k,eta, lambda, t, dt)
    
    y = y0;
    Y= [0,y0*t/n];
    i=1;
    
    while(Y(i) < t)
        V = normrnd(0,sqrt(dt));
        if(0 < y(i) + k*(eta-y(i))*dt + lambda*sqrt(y(i))*V)
            y(i+1) = y(i) + k*(eta-y(i))*dt + lambda*sqrt(y(i))*V;
        else
            y(i+1) = 0;
        end
        Y(i+2) = Y(i+1) + y(i+1)*t/n;
        i=i+1;
    end
    
    T = 0:dt:length(Y);
    
end