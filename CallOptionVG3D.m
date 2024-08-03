function [K,COP,mu] = CallOptionVG3D(C, G, M, S, K, r ,q, tau,  n1, m1,k1)
    
    mu = log(CharacteristicFunctionVG(-i, C, G, M,1));
    
    lo = log(S./K) + (r-q)*tau - mu*tau;
    Mat = zeros(n1+1,m1+1,k1+1);
    
    for n = 0:n1
        for m = 0:m1
            for k = 0:k1
            Mat(n+1,m+1,k+1) = ((-1)^(n+m)) * gamma(C*tau + m) * gamma(-1 - 2*C*tau -k-n-m) * (M^n) * (G^m) * (- lo)^(1 + 2*C*tau +k+n+m) / (gamma(1 - C*tau -n)*factorial(n)*factorial(m));
            end
        end
    end
    
    Nat = zeros( n1, m1,k1);
    for n = 0:n1
        for m = 0:m1
            for  k = 0:k1
            Nat(n+1,m+1,k+1) = ((-1)^(n+m)) * gamma(C*tau + m) * gamma(1 + 2*C*tau +k-n+m) * (M^(-1-2*C*tau+n-k-m)) * (G^m) * (- lo)^n / (gamma(2 + C*tau -n+k+m)*factorial(n)*factorial(m));
            end
        end
    end

    Kat = zeros( n1, m1,k1);
    
    for n = 0:n1
        for m = 0:m1
            for  k = 0:k1
            Kat(n+1,m+1,k+1) = ((-1)^(C*tau + m)) * gamma(C*tau + n) * gamma(C*tau + m) * (M^n) * (G^m) * (lo^(1 + 2*C*tau +k+m+n)) / (gamma(2 + 2*C*tau +k+n+m)*factorial(n)*factorial(m));
            end
        end
    end    

    COP =    real( K * ((G*M)^(C*tau)) * exp(-(r-q)*tau) * (sum(sum(sum(Mat))) + sum(sum(sum(Nat))) + sum(sum(sum(Kat)))) / ((gamma(C*tau))^2));

end