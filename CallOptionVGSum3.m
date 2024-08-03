function [K,COP,mu] = CallOptionVGSum2(C, G, M, S, K, r ,q, tau,  n, m)
    
    mu = log(VGCharacteristicFunction(-i, C, G, M));
    
    lo = log(S/K) + (r-q)*tau;
    Mat = zeros(n,m);
    Nat = zeros(m,m);
    
    for k = 0:n
        for j = 1:m
            Mat(k+1,j) = factorial(j-1)*((- lo + mu*tau)^(1+k+j))*(M^k) / factorial(k+j+1);
            %k
            %j
            %((lo  - mu*tau)^j)
            %(((M^k)/k) - psi(j) -psi(j+1))
            %((-1)^j)
            %(M^k)
            %((-lo  + mu*tau)^(1+k+j))
            %lo
            %mu
            %(((factorial(k))^2)*factorial(1+k+j))
            %Mat(k+1,j+1)
        end
    end
    for j = 0:m
        for k = 0:j+1
            Nat(k+1,j+1) = ((-1)^k)*(M^(-1+k+j))*((-lo + mu*tau)^k);

        end
    end
    
    
    COP = K*C*exp(-(r-q)*tau)*(sum(sum(Mat))+ sum(sum(Nat)));
end