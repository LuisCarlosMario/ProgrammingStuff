function [K,COP,mu] = VAPCallOptionVG5D(C, G, M, S, K, r ,q, tau,  n1, m1,k1)
    
    mu = vpa(log(CharacteristicFunctionVG(-i, C, G, M, 1)));
    
    t1 = length(tau);
    r1 = length(K);
    s1 = length(S);
    lo = zeros(r1,t1,s1);
    %lo = log(S./K) + (r-q).*tau - mu.*tau;
    for j = 1:s1
        lo(:,:,j) = vpa(log(vpa(S(j)./K)) + vpa((r-q).*tau) - vpa(mu.*tau));
    end
    Mat = zeros(r1,t1,s1,n1+1,m1+1,k1+1);

    for s = 1:s1
    for t = 1:t1
        for l = 1:r1
            for n = 0:n1
                for m = 0:m1
                    for k = 0:k1
                        %[l,t,n, m, k]
                        Mat(l,t,s,n+1,m+1,k+1) = vpa(((-1)^(n+m)) * vpa(gamma(C*tau(t) + m)) * vpa(gamma(-1 - 2*C*tau(t) -k-n-m)) * vpa((vpa(M)^n)) * vpa((vpa(G)^m)) * vpa((- vpa(lo(l,t,s)) )^(1 + 2*C*tau(t) +k+n+m)) / vpa((vpa(gamma(1 - C*tau(t) -n))*factorial(n)*factorial(m))));
                        [n,m,k]
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
                        Nat(l,t,s,n+1,m+1,k+1) = vpa(((-1)^(n+m)) * vpa(gamma(vpa(C)*tau(t) + m)) * vpa(gamma(1 + 2*vpa(C)*tau(t) +k-n+m)) * vpa((vpa(M)^(-1-2*vpa(C)*tau(t)+n-k-m))) * vpa((vpa(G)^m)) * vpa((- vpa(lo(l,t,s)))^n) / vpa((vpa(gamma(2 + C*tau(t) -n+k+m))*factorial(n)*factorial(m))));
                        [n,m,k]
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
                            Kat(l,t,s,n+1,m+1,k+1) = vpa(((-1)^(C*tau(t) + m)) * vpa(gamma(vpa(C)*tau(t) + n)) * vpa(gamma(vpa(C)*tau(t) + m)) * (vpa(M)^n) * (vpa(G)^m) * ((vpa(lo(l,t,s)))^(1 + 2*vpa(C)*tau(t) +k+m+n)) / (vpa(gamma(2 + 2*vpa(C)*tau(t) +k+n+m))*factorial(n)*factorial(m)));
                            [n,m,k]
                        else
                            Kat(l,t,s,n+1,m+1,k+1) = 0;
                        end
                    end
                end
            end
        end
    end  
    end

    COP =    real( vpa(K .* ((vpa(G)*vpa(M)).^(vpa(C)*tau)) .* vpa(exp( -(r-q)*tau)) .* (vpa(sum(sum(sum(Mat,6),5),4)) + vpa(sum(sum(sum(Nat,6),5),4)) + vpa(sum(sum(sum(Kat,6),5),4))) ./ ((vpa(gamma(vpa(C)*tau))).^2)));
    %COP(COP<0) = 0;
end