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