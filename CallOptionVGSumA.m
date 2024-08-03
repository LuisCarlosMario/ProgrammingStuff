function [K,COP,mu] = CallOptionVGSumA(C, G, M, S, K, r ,q, tau,  n1, m1)
    
    mu = log(VGCharacteristicFunction(-i, C, G, M));
    
    lo = log(S/K) + (r-q)*tau;
    Mat = zeros(n1+1,m1+1);
    
    for n = 0:n1
        for m = 0:m1
            Mat(n+1,m+1) = ((-1)^(n+m+1))*(M^n)*((-lo  + mu*tau)^(2-m))* factorial(m) / ((factorial(n))^2);
            %k
            %j
            %((-1)^j)
            %(M^k)
            %((-lo  + mu*tau)^(1+k+j))
            %lo
            %mu
            %(((factorial(k))^2)*factorial(1+k+j))
            %Mat(k+1,j+1)
        end
    end
    
    COP = K*C*exp(-(r-q)*tau)*sum(sum(Mat));
end