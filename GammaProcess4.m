function [T,G] = GammaProcess4(a, b, T)
    
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
