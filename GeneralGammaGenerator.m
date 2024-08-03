function g = GeneralGammaGenerator(a)

    n = size(a,2);
    g = zeros([1,n]);
    
    for i = 1:n
        if(a <= 1)
            g(i) = JohnksGammaGenerator(a(i)) / b;
        else
            g(i) = BestGammaGenerator(a*(i)) / b;
        end
    end
    
end