function [K,Abs,Res,mu] = ConvergenceVG5D(C, G, M, S, K, r ,q, tau,  n1, m1,k1)
    
    mu = log(CharacteristicFunctionVG(-i, C, G, M, 1));
    
    t1 = length(tau);
    r1 = length(K);
    s1 = length(S);
    lo = zeros(r1,t1,s1);
    %lo = log(S./K) + (r-q).*tau - mu.*tau;
    for j = 1:s1
        lo(:,:,j) = log(S(j)./K) + (r-q).*tau - mu.*tau;
    end
    Mat = zeros(r1,t1,s1,n1+1,m1+1,k1+1);

    for s = 1:s1
    for t = 1:t1
        for l = 1:r1
            for n = 0:n1
                for m = 0:m1
                    for k = 0:k1
                        %[l,t,n, m, k]
                        Mat(l,t,s,n+1,m+1,k+1) = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(-1 - 2*C*tau(t) -k-n-m) * (M^n) * (G^m) * (- lo(l,t,s) )^(1 + 2*C*tau(t) +k+n+m) / (gamma(1 - C*tau(t) -n)*factorial(n)*factorial(m));
                    end
                end
            end
        end
    end
    end

    
    Nat = zeros(r1,t1,s1, n1, m1,k1);
    for s = 1:s1
    for n = 0:n1
        for m = 0:m1
            for  k = 0:k1
                for t = 1:t1
                    for l = 1:r1
                        Nat(l,t,s,n+1,m+1,k+1) = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(1 + 2*C*tau(t) +k-n+m) * (M^(-1-2*C*tau(t)+n-k-m)) * (G^m) * (- lo(l,t,s))^n / (gamma(2 + C*tau(t) -n+k+m)*factorial(n)*factorial(m));
                    end
                end
            end
        end
    end
    end

    Kat = zeros(r1,t1,s1, n1, m1,k1);
    
    for s = 1:s1
    for n = 0:n1
        for m = 0:m1
            for  k = 0:k1
                for t = 1:t1
                    for l = 1:r1
                        %Kat(n+1,m+1,k+1) = ((-1)^m) * gamma(C*tau + n) * gamma(C*tau + m) * (M^(-n-C*tau)) * (G^m) * (lo^(1+C*tau+k+m-n)) / (gamma(2 + 2*C*tau +k+n+m)*factorial(n)*factorial(m));
                        if (lo(l,t) > 0)
                            Kat(l,t,s,n+1,m+1,k+1) = ((-1)^(C*tau(t) + m)) * gamma(C*tau(t) + n) * gamma(C*tau(t) + m) * (M^n) * (G^m) * ((lo(l,t,s))^(1 + 2*C*tau(t) +k+m+n)) / (gamma(2 + 2*C*tau(t) +k+n+m)*factorial(n)*factorial(m));
                        else
                            Kat(l,t,s,n+1,m+1,k+1) = 0;
                        end
                    end
                end
            end
        end
    end  
    end
    
    
    Res = zeros(n1,m1,k1);
    %for n = 0:n1
    %    for m = 0:m1
    %        for  k = 0:k1   
    %            for t = 1:t1
    %                for l = 1:r1
    %                    for s = 1:s1
    %                        M2 = real( K .* ((G*M).^(C*tau)) .* exp( -(r-q)*tau) .* (Mat(:,:,:,n+1,m+1,k+1) + Nat(:,:,:,n+1,m+1,k+1) + Kat(:,:,:,n+1,m+1,k+1)) ./ ((gamma(C*tau)).^2));
    %                        MM = real( K .* ((G*M).^(C*tau(t))) .* exp( -(r-q)*tau(t)) .* (Mat(l,t,s,n+1,m+1,k+1) + Nat(l,t,s,n+1,m+1,k+1) + Kat(l,t,s,n+1,m+1,k+1))) ./ ((gamma(C*tau(t))).^2));
    %                    end
    %                end
    %            end
    %            Res(n,m,k) = mean(MM.^2,'all');
    %        end
    %    end
    %end
    
    for n = 0:n1
        for m = 0:m1
            for  k = 0:k1   
                M2 = real( K .* ((G*M).^(C*tau)) .* exp( -(r-q)*tau) .* (Mat(:,:,:,n+1,m+1,k+1) + Nat(:,:,:,n+1,m+1,k+1) + Kat(:,:,:,n+1,m+1,k+1)) ./ ((gamma(C*tau)).^2));
                Res(n+1,m+1,k+1) = sqrt(sum(M2.^2,'all'));
                Abs(n+1,m+1,k+1) = sum(abs(M2),'all');
            end
        end
    end
    
    %COP(COP<0) = 0;
end