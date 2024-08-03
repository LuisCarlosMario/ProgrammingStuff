function [K,COP] = CallOptionSumBS(sig, S, K, r,tau, n, m)
    
    lo = log(S/K) + r*tau;
    M = zeros(n+1,m+1);
    
    for i = 0:n
        for j = 0:(1+2*i)
            M(i+1,j+1) = ((-1)^i)*factorial(2*i)*(S - ((-1)^j)*K*exp(-r*tau))*(lo^(1+2*i-j))*(sig*sqrt(tau))^(-1+2*(j-i)) / ( 2^(i+j) * factorial(i) * factorial(j) * factorial(1+2*i-j) );
            M(i+1,j+1)
        end
    end
    
    COP = (1/2)*(S - K*exp(-r*tau))+ (1/sqrt(2*pi))* sum(sum(M));
end
