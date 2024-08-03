function [K,Abs,Res,mu] = ConvergenceVG(C, G, M, S, K, r ,q, tau,  n, m,k)
    
    mu = log(CharacteristicFunctionVG(-i, C, G, M, 1));
    
    t1 = length(tau);
    r1 = length(K);
    s1 = length(S);
    lo = zeros(r1,t1,s1);
    %lo = log(S./K) + (r-q).*tau - mu.*tau;
    for j = 1:s1
        lo(:,:,j) = log(S(j)./K) + (r-q).*tau - mu.*tau;
    end
    Mat = zeros(r1,t1,s1);

    for s = 1:s1
        for t = 1:t1
            for l = 1:r1
                    Mat(l,t,s) = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(-1 - 2*C*tau(t) -k-n-m) * (M^n) * (G^m) * (- lo(l,t,s) )^(1 + 2*C*tau(t) +k+n+m) / (gamma(1 - C*tau(t) -n)*factorial(n)*factorial(m));
            end
        end
    end

    
    Nat = zeros(r1,t1,s1);
    for s = 1:s1
        for t = 1:t1
            for l = 1:r1
                        Nat(l,t,s) = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(1 + 2*C*tau(t) +k-n+m) * (M^(-1-2*C*tau(t)+n-k-m)) * (G^m) * (- lo(l,t,s))^n / (gamma(2 + C*tau(t) -n+k+m)*factorial(n)*factorial(m));
            end
        end
    end

    Kat = zeros(r1,t1,s1);
    
    for s = 1:s1
        for t = 1:t1
            for l = 1:r1
                        %Kat(n+1,m+1,k+1) = ((-1)^m) * gamma(C*tau + n) * gamma(C*tau + m) * (M^(-n-C*tau)) * (G^m) * (lo^(1+C*tau+k+m-n)) / (gamma(2 + 2*C*tau +k+n+m)*factorial(n)*factorial(m));
                        if (lo(l,t) > 0)
                            Kat(l,t,s) = ((-1)^(C*tau(t) + m)) * gamma(C*tau(t) + n) * gamma(C*tau(t) + m) * (M^n) * (G^m) * ((lo(l,t,s))^(1 + 2*C*tau(t) +k+m+n)) / (gamma(2 + 2*C*tau(t) +k+n+m)*factorial(n)*factorial(m));
                        else
                            Kat(l,t,s) = 0;
                        end
            end
        end  
    end
    
    
   %Res = zeros(n,m,k);
   %Abs = zeros(n,m,k); 
 
   M2 = real( K .* ((G*M).^(C*tau)) .* exp( -(r-q)*tau) .* (Mat+ Nat + Kat) ./ ((gamma(C*tau)).^2));
   Res = sqrt(sum(M2.^2,'all'));
   Abs = sum(abs(M2),'all');
    
    %COP(COP<0) = 0;
end