function [T,X] = VarianceGamma2(C, G, M, t, n)
    
    [T,G1] = GammaProcess(C, M, t, n);
    [T2,G2] = GammaProcess(C, G, t, n);
    
    X = G1 - G2;
    
end

function [T,G] = GammaProcess2(a, b, T)
    
    n = size(T,2);
    g = zeros([1,n+1]);
    
    for i = 1:n
        if(dt*a <= 1)
            g(i+1) = JohnksGammaGenerator(a*T(i)) / b;
        else
            g(i+1) = BestGammaGenerator(a*T(i)) / b;
        end
    end
    
    G=cumsum(g);
    
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