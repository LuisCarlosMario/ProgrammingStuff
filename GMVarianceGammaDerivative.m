function COP = GMVarianceGammaDerivative(C, G, M, S, K, r ,q, tau, n1, m1,k1,p)
    
    % Inputs:
    % C - parameter C of the Variance Gamma process
    % G - parameter G of the Variance Gamma process
    % M - parameter M of the Variance Gamma process
    % S - initial stock price value
    % K - strike price vector
    % r - risk free rate of return
    % q - dividend rate on r
    % tau - time to maturity vector
    % n1 - number of sums on n variable of the triple sum series for the European Call Option driven by the Variance Gamma
    % m1 - number of sums on m variable of the triple sum series for the European Call Option driven by the Variance Gamma
    % k1 - number of sums on k variable of the triple sum series for the European Call Option driven by the Variance Gamma
    
    % Outputs:
    % COP - price of the European Call Option matrix
    % POP - prices of the European Put Option matrix
    % lo - values of the parameter [log] matrix
    % mu - real asset rate of return under 'P' driven by the Variance Gamma process
    
    
    
    mu = log(CharacteristicFunctionVG(-i, C, G, M, 1)); % mu is defined as the log(E[e^(tau X_VG)]),
                                                        % i.e. as the real asset rate of return under 'P' driven by the Variance Gamma process
    
    t1 = length(tau);                       % t1 is defined as the length of vector tau
    r1 = length(K);                         % r1 is defined as the length of vector K
    lo = log(S./K) + (r-q).*tau - mu.*tau;  % lo is defined as the matrix of the values of variable [log] under the given parameters
    Mat = zeros(r1,t1,n1+1,m1+1,k1+1);      % Mat is defined as zero five dimensional matri
    % The values of the terms in C^1_VG for each strike price (in vector K)
    % each time to maturnity (in vector tau) and values between 1 and n1, 1
    % and m and, 1 and k1, are computed in the following 5 "for" loops
    %m0 = tau(t)*(log(G.*M)- 2 * Digamma(C.*tau(t),p));
    
    for t = 1:t1
        for l = 1:r1
            for n = 0:n1
                for m = 0:m1
                    for k = 0:k1
                        m0 = (C*tau(t)/G)*(C*tau(t)/M);
                        m11 = m*n/(G*m);
                        MMat = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(-1 - 2*C*tau(t) -k-n-m) * (M^n) * (G^m) * (- lo(l,t) )^(1 + 2*C*tau(t) +k+n+m) / (gamma(1 - C*tau(t) -n)*factorial(n)*factorial(m));
                        Mat(l,t,n+1,m+1,k+1) = (m0 + m11) * MMat;  % Mat(l,t,n+1,m+1,k+1) is defined as the value of the term in C^1_VG for the
                    end                                                                                                                                                                                                         % corresponding K(l), tau(t), n, m and k computed according to the Variance Gamma formula                                        
                end
            end
        end
    end

    Nat = zeros(r1,t1,n1+1,m1+1,k1+1);   
    
    % The values of the terms in C^2_VG for each strike price (in vector K)
    % each time to maturnity (in vector tau) and values between 1 and n1, 1
    % and m and, 1 and k1, are computed in the following 5 "for" loops
    
    for t = 1:t1
        for l = 1:r1
            for n = 0:n1
                for m = 0:m1
                    for k = 0:k1
                        m0 = (C*tau(t)/G)*(C*tau(t)/M);
                        m22 = m*n/(G*m);
                        NNat = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(1 + 2*C*tau(t) +k-n+m) * (M^(-1-2*C*tau(t)+n-k-m)) * (G^m) * (- lo(l,t))^n / (gamma(2 + C*tau(t) -n+k+m)*factorial(n)*factorial(m));
                        Nat(l,t,n+1,m+1,k+1) = (m0 + m22) * NNat;
                    end                                                                                                                                                                                                         % corresponding K(l), tau(t), n, m and k computed according to the Variance Gamma formula 
                end
            end
        end
    end

    
    Kat = zeros(r1,t1,n1+1,m1+1,k1+1);
    
    % The values of the terms in C^3_VG for each strike price (in vector K)
    % each time to maturnity (in vector tau) and values between 1 and n1, 1
    % and m and, 1 and k1, are computed in the following 5 "for" loops
    
    for t = 1:t1
        for l = 1:r1
            for n = 0:n1
                for m = 0:m1
                    for k = 0:k1
                        if  (lo(l,t) > 0)
                            m0 = (C*tau(t)/G)*(C*tau(t)/M);
                            m33 = m*n/(G*m);
                            KKat = ((-1)^(C*tau(t) + m)) * gamma(C*tau(t) + n) * gamma(C*tau(t) + m) * (M^n) * (G^m) * ((lo(l,t))^(1 + 2*C*tau(t) +k+m+n)) / (gamma(2 + 2*C*tau(t) +k+n+m)*factorial(n)*factorial(m));  % if [log] > 0 Kat(l,t,n+1,m+1,k+1) is defined as the value of the term in C^3_VG for the
                            Kat(l,t,n+1,m+1,k+1) =  (m0 + m33) * KKat;
                        else                                                                                                                                                                                                            % corresponding K(l), tau(t), n, m and k computed according to the Variance Gamma formula
                            Kat(l,t,n+1,m+1,k+1) = 0;                                                                                                                                                                                   % else if [log] < 0 Kat(l,t,n+1,m+1,k+1) is defined as 0                                    
                        end
                    end                                                                                                                                                                                                                 
                end                                                                                                                                                                                                                     
            end
        end
    end    
    
    % Tha matrix for the price of the European Call Cptions is computed:
    COP =    real( K .* ((G*M).^(C*tau)) .* exp( -(r-q).*tau) .* (sum(sum(sum(Mat,5),4),3) + sum(sum(sum(Nat,5),4),3) + sum(sum(sum(Kat,5),4),3)) ./ ((gamma(C*tau)).^2));   % COP is defined as a two dimensional matrix, that varies as K and tau vary, by
                                                                                                                                                                            % summing the terms in Mat, Nat and Kat from 1 to n1, 1 to m1 and 1 to k1, respectively

    
end