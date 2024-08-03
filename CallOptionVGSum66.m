function [K,COP,mu] = CallOptionVGSum66(C, G, M, S, K, r ,q, tau,  n0, m0)
    
    mu = log(VGCharacteristicFunction(-i, C, G, M));
    
    lo = log(S/K) + (r-q)*tau;
    Mat = zeros(n0+1,m0+1);
    
    for n = 0:n0
        for m = 0:m0
            if (n ~= m + 1)
                Mat(n+1,m+1) = ((-1)^n)*(M^(n-m-1))*((-lo+mu*tau)^n) / (factorial(n)*(m-n+1));
            else 
                Mat(n+1,m+1) = (psi(m+1)+psi(m+2))*((lo - mu*tau)^(m+1)) / factorial(m+1);
            end
        end
    end
    
    COP = K*C*exp(-(r-q)*tau)*(sum(sum(Mat)));
    
end