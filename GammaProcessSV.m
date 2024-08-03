function G = GammaProcessSV(a, b, T)
    
    n = size(T,1);
    t = size(T,2);
    g = zeros([n,t]);
    for j = 1:t
        for i=1:n-1
            if((T(j,i+1)-T(j,i))*a <= 1)
                g(i+1,j) = JohnksGammaGenerator((T(j,i+1)-T(j,i))*a ) / b;
            else
                g(i+1,j) = BestGammaGenerator((T(j,i+1)-T(j,i))*a ) / b;
            end
        end
    end
    G=cumsum(g);
end