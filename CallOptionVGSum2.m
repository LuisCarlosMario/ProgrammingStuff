function [K,COP,mu] = CallOptionVGSum2(C, G, M, S, K, r ,q, tau,  n, m)
    
    mu = log(VGCharacteristicFunction(-i, C, G, M));
    
    lo = log(S/K) + (r-q)*tau;
    Mat = zeros(n+1,m+1);
    
    for j = 0:m
            Mat(1,j+1) = ((lo  - mu*tau)^(j+1))*(psi(j+1)) / factorial(j+1);
    end   
    
    K*C*exp(-(r-q)*tau)*(sum(sum(Mat)))
   
    for k = 1:n
        for j = 0:m
            Mat(k+1,j+1) = ((lo  - mu*tau)^(1+k+j))*(M^k) / (factorial(k+j+1)*k);
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
    K*C*exp(-(r-q)*tau)*(sum(sum(Mat)))
    
    Nat = zeros(n,m);
    for k = 1:n
        for j = 0:m
            Nat(k,j+1) = -((lo  - mu*tau)^j)*(M^(-k)) / (factorial(j)*k);
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
    K*C*exp(-(r-q)*tau)*(sum(sum(Nat)))    

    for k = 0:n
            Rat(k+1,1) =- ((lo  - mu*tau)^k)*(M^(-1)) / (k*factorial(k));
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
    %K*C*exp(-(r-q)*tau)*(sum(sum(Rat)))
    Fat = zeros(n,1);
    for k = 1:n
            Fat(k,1) = -((lo  - mu*tau)^k)*(M^k) / (k*factorial(k));
    end 
    
    
    COP = K*C*exp(-(r-q)*tau)*(sum(sum(Mat))+sum(sum(Nat)) );
end