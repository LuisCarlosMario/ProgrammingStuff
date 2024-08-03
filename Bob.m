function Rato = Bob(C, G, M, S, K, r ,q, tau, n1, m1, k1, p)


    % Inputs:
    % C - parameter C of the Variance Gamma process
    % G - parameter G of the Variance Gamma process
    % M - parameter M of the Variance Gamma process
    % S - initial stock price value
    % K - strike price vector
    % r - risk free rate of return
    % q - dividend rate on r
    % tau - time to maturity vector
    % n1 - number of sums on n variable of the triple sum series for the European Call Option Theta measure driven by the Variance Gamma
    % m1 - number of sums on m variable of the triple sum series for the European Call Option Theta measure driven by the Variance Gamma
    % k1 - number of sums on k variable of the triple sum series for the European Call Option Theta measure driven by the Variance Gamma
    % p - number of sums in the diagamma representation series
    
    % Outputs:
    % Theta - Theta measure matrix of the European Call Option driven by the Variance Gamma process

    mu = log(CharacteristicFunctionVG(-i, C, G, M, 1)); % mu is defined as the log(E[e^(tau X_VG)]),
                                                        % i.e. as the real asset rate of return under 'P' driven by the Variance Gamma process
    
    t1 = length(tau);                           % t1 is defined as the length of vector tau
    r1 = length(K);                             % r1 is defined as the length of vector K
    lo = log(S./K) + (r-q).*tau - mu.*tau;      % lo is defined as the matrix of the values of variable [log] under the given parameters
    m0 = C*log(G*M)-(r-q)-2*C*Digamma(C*tau,p); % mu is defined as 
    MatPsi1 = zeros(r1,t1,n1+1,m1+1,k1+1);       % Matpsi is defined as zero five dimensional matrix
    MatPsi2 = zeros(r1,t1,n1+1,m1+1,k1+1);
    %theta1 = C*log(G*M)-(r-q)-2*C*Digamma(C*tau(t),p) + C*Digamma(C*tau(t)+m,p)-2*C*Digamma(-1-2*C*tau(t)-k-n-m,p)+C*Digamma(1-C*tau(t)-n,p) + 2*C*log(-(lo(l,t));
    
    for t = 1:t1
        for l = 1:r1
            for n = 0:n1
                for m = 0:m1
                    for k = 0:k1
                        %[l,t,n, m, k]
                        Mat = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(-1 - 2*C*tau(t) -k-n-m) * (M^n) * (G^m) * (- lo(l,t) )^(1 + 2*C*tau(t) +k+n+m) / (gamma(1 - C*tau(t) -n)*factorial(n)*factorial(m));
                        MatCall = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(- 2*C*tau(t) -k-n-m) * (M^n) * (G^m) * (- lo(l,t) )^(2*C*tau(t) +k+n+m) / (gamma(1 - C*tau(t) -n)*factorial(n)*factorial(m));
                        MatDelta = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(- 2*C*tau(t) -k-n-m) * (M^n) * (G^m) * (- lo(l,t) )^(2*C*tau(t) +k+n+m) / (gamma(1 - C*tau(t) -n)*factorial(n)*factorial(m));
                        theta1 = C*log(G*M)-(r-q)-2*C*Digamma(C*tau(t),p) + C*Digamma(C*tau(t)+m,p)-2*C*Digamma(-1-2*C*tau(t)-k-n-m,p)+C*Digamma(1-C*tau(t)-n,p) + 2*C*log(-(lo(l,t)));
                        m11 = C*Digamma(C*tau+m,p)-2*C*Digamma(-1-2*C*tau-k-n-m,p)+C*Digamma(1-C*tau-n,p);
                        m12 = 2*C*log(-lo(l,t))+(1+2*C*tau+k+n+m)*(r-q-mu)/lo(l,t);    
                        MatPsi1(l,t,n+1,m+1,k+1) = (m0 + m11 + m12)*Mat;
                        MatPsi2(l,t,n+1,m+1,k+1) = (theta1(l,t)*MatCall + (r-q-mu)*MatDelta);
                    end
                end
            end
        end
    end
    
    Rato = MatPsi1 - MatPsi2;
end