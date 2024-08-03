function [K,Theta,mu] = ThetaVG4D(C, G, M, S, K, r ,q, tau,  n1, m1,k1,p)

  
    mu = log(CharacteristicFunctionVG(-i, C, G, M, 1));
    
    t1 = length(tau);
    r1 = length(K);
    lo = log(S./K) + (r-q).*tau - mu.*tau;
    m0 = C*log(G*M)-(r-q)-2*C*Digamma(C*tau,p);

    
    %Normal
    MatPsi = zeros(r1,t1,n1+1,m1+1,k1+1);
    %Mat2 = zeros(r1,t1,n1+1,m1+1,k1+1);
    for t = 1:t1
        for l = 1:r1
            for n = 0:n1
                for m = 0:m1
                    for k = 0:k1
                        %[l,t,n, m, k]
                        Mat = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(-1 - 2*C*tau(t) -k-n-m) * (M^n) * (G^m) * (- lo(l,t) )^(1 + 2*C*tau(t) +k+n+m) / (gamma(1 - C*tau(t) -n)*factorial(n)*factorial(m));
                        m11 = C*Digamma(C*tau+m,p)-2*C*Digamma(-1-2*C*tau-k-n-m,p)+C*Digamma(1-C*tau-n,p);
                        m12 = 2*C*log(-lo(l,t))+(1+2*C*tau+k+n+m)*(r-q-mu)/lo(l,t);    
                        
                        MatPsi(l,t,n+1,m+1,k+1) = (m0 + m11 + m12)*Mat;
                        
                        %Mat2(l,t,n+1,m+1,k+1) = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(- 2*C*tau(t) -k-n-m) * (M^n) * (G^m) * (- lo(l,t) )^(2*C*tau(t) +k+n+m) / (gamma(1 - C*tau(t) -n)*factorial(n)*factorial(m));
                        
                        [S 1 t l n m k]
                    end
                end
            end
        end
    end


    NatPsi = zeros(r1,t1,n1+1,m1+1,k1+1);
    %Nat2 = zeros(r1,t1,n1+1,m1+1,k1+1);
    for n = 0:n1
        for m = 0:m1
            for  k = 0:k1
                for t = 1:t1
                    for l = 1:r1
                        Nat = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(1 + 2*C*tau(t) +k-n+m) * (M^(-1-2*C*tau(t)+n-k-m)) * (G^m) * (- lo(l,t))^n / (gamma(2 + C*tau(t) -n+k+m)*factorial(n)*factorial(m));
                        m21 = C*Digamma(C*tau+m,p)+2*C*Digamma(1+2*C*tau+k-n+m,p)-C*Digamma(2+C*tau+k-n+m,p);
                        %m22 = n*(r-q-mu)/lo(l,t)-2*C*log(M);
                        m22 = -2*C*log(M) + n*(r-q-mu)/lo(l,t);
                        
                        NatPsi(l,t,n+1,m+1,k+1)= (m0 + m21 + m22)*Nat;
                        
                        %Nat2(l,t,n+1,m+1,k+1) = ((-1)^m) * gamma(C*tau(t) + m) * gamma( 2*C*tau(t) +k-n+m) * (M^(-2*C*tau(t)+n-k-m)) * (G^m) * (lo(l,t))^n / (gamma(1 + C*tau(t) -n+k+m)*factorial(n)*factorial(m));
                        [S 2 n m k t l]
                    end
                end
            end
        end
    end


    KatPsi = zeros(r1,t1,n1+1,m1+1,k1+1);
    %Kat2 = zeros(r1,t1,n1+1,m1+1,k1+1);
    for n = 0:n1
        for m = 0:m1
            for  k = 0:k1
                for t = 1:t1
                    for l = 1:r1
                        %Kat(n+1,m+1,k+1) = ((-1)^m) * gamma(C*tau + n) * gamma(C*tau + m) * (M^(-n-C*tau)) * (G^m) * (lo^(1+C*tau+k+m-n)) / (gamma(2 + 2*C*tau +k+n+m)*factorial(n)*factorial(m));
                        if (lo(l,t) > 0)
                            Kat = ((-1)^(C*tau(t) + m)) * gamma(C*tau(t) + n) * gamma(C*tau(t) + m) * (M^n) * (G^m) * ((lo(l,t))^(1 + 2*C*tau(t) +k+m+n)) / (gamma(2 + 2*C*tau(t) +k+n+m)*factorial(n)*factorial(m));
                            m31 = C*Digamma(C*tau+n,p)+C*Digamma(C*tau+m,p)-2*C*Digamma(2+2*C*tau+k+n+m,p);
                            m32 = C*pi*i+2*C*log(lo(l,t))+(1+2*C*tau+k+n+m)*(r-q-mu)/lo(l,t);
                            
                            KatPsi(l,t,n+1,m+1,k+1) = (m0 + m31 + m32)*Kat;
                            
                            %Kat2(l,t,n+1,m+1,k+1) = ((-1)^(C*tau(t) + m)) * gamma(C*tau(t) + n) * gamma(C*tau(t) + m) * (M^n) * (G^m) * ((lo(l,t))^( 2*C*tau(t) +k+m+n)) / (gamma(1 + 2*C*tau(t) +k+n+m)*factorial(n)*factorial(m));
                            [S 3 n m k t l]
                        else
                            KatPsi(l,t,n+1,m+1,k+1) = 0;
                            %Kat2(l,t,n+1,m+1,k+1) = 0;
                        end
                    end
                end
            end
        end
    end
    


    %m1= m0 +2*C*log(-lo)+(1+2*c*tau(t)+k+n+m)*(r-q-mu)./lo;
    %m2= m0-2*C*log(M);
    %m3= m0+2*C+(r-q-mu)./lo+i*C*pi;
    

    Theta =    real( - K .* ((G*M).^(C*tau)) .* exp( -(r-q)*tau) .* (sum(sum(sum(MatPsi,5),4),3) + sum(sum(sum(NatPsi,5),4),3) + sum(sum(sum(KatPsi,5),4),3) ) ./ ((gamma(C*tau)).^2));
    


%[K,D,mu] = DeltaVG4D(C, G, M, S, K, r ,q, tau,  n1, m1,k1);
%[K,COP,mu] =CallOptionVG4D(C, G, M, S, K, r ,q, tau,  n1, m1,k1);

%Theta = -(r-q)*COP + ((r-q)-mu)*S*D;
end