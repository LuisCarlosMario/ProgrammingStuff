function [T,X] = VGSV(C, G, M, k, eta, lambda, t, n)
    
    [T,y,Y] = CIRProcess(y0, k,eta , lambda, t, n)
    [T,G1] = GammaProcess(C, M, t, n);
    [T2,G2] = GammaProcess(C, G, t, n);
    
    X = G1 - G2;
    
end

function [T,y,Y] = CIRProcess(y0, k,eta , lambda, t, n)
    
    dt=t/n;
    T=0:dt:t;
    y = zeros([1,n+1]);
    y(1) = y0;
    V = normrnd(0,sqrt(dt),[1,n]);
    
    for i = 1:n
        if(0 < y(i) + k*(eta-y(i))*dt + lambda*sqrt(y(i))*V(i))
            y(i+1) = y(i) + k*(eta-y(i))*dt + lambda*sqrt(y(i))*V(i);
        else
            y(i+1) = 0;
        end
    end
    Y=cumsum(y)*t/n;
end

function [Tau,a] = GammaProcess(a, b, T,n )
    
    dt=t/n;
    
    if(dt*a <= 1)
        g = JohnksGammaGenerator(T) / b;
    else
        g = BestGammaGenerator(T) / b;
    end
    
end


function g = JohnksGammaGenerator(a)
    n = size(a,2);
    E = exprnd(1,[1,n]);
    g=zeros([1,n]);
    for i=1:n
        X=1;
        Y=1;
        while(X + Y > 1)
            U = rand([1,2]);
            X = (U(1))^(1/a(i));
            Y =(U(2)^(1/(1-a(i))));
        end
        g(i) = X*E(i) / (X+Y);
    end
end

function X = BestGammaGenerator(a)
    n = size(a,2);
    b=a-1;
    c=3*a-3/4;
    X=-1+zeros([1,n]);
    Y=0;
    Z=0;
    for i = 1:n
        while(log(Z) > 2 * (b(i)* log(X(i)/b(i)) - Y)  || X(i) < 0)
            U = rand([1,2]);
            W = U(1)*(1-U(1));
            Y = sqrt(c(i)/W)*(U(1)-1/2);
            X(i) = b(i) + Y;
            Z = 64 * (W^3) * (U(2)^3);
        end
    end
end