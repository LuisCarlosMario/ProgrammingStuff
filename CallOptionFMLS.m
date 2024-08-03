function [K,COP,mu] = CallOptionFMLS(alp, gam, sig, S, K, r,tau, n0, n, m)
    
    mu = Mu(alp, gam, sig, n0);
    
    lo = log(S/K) + r*tau;
    M = zeros(n+1,m+1);
    
    for i = 0:n
        for j = 0:m
            M(i+1,j+1) = ( ((lo + mu*tau)^i) / (factorial(i) * gamma( 1 - (gam*(i-j-1)/alp)))) * ((- mu*(tau^gam) )^((1+j-i)/alp));
        end
    end
    
    COP = (K*exp(-r*tau)/alp)*sum(sum(M));
end
