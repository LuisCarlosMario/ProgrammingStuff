function [T,G] = GammaProcess5(a, b, t, dt)
    
    T=0:dt:t;
    n = length(T)-1;
    V = a*1 +zeros([1,n]);
    
    if(dt*a <= 1)
        g = JohnksGammaGenerator(V*dt) / b;
    else
        g = BestGammaGenerator(V*dt) / b;
    end
    
    G=[0,cumsum(g)];
    
end


function g = JohnksGammaGenerator(a)
    n = length(a);
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
    n = length(a);
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