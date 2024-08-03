function G = GammaProcess3(a, b, T)
        G = JohnksGammaGenerator(a.*T) / b;
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