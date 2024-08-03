function G = GammaProcess2(a, b, T)
    
    G = zeros([1,length(T)]);

    for i = 1:lenght(T)
        if(a*T(i) <= 1)
            G(i) = JohnksGammaGenerator(a*T(i)) / b;
        else
            G(i) = BestGammaGenerator(a*T(i)) / b;
        end
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