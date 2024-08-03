function [TEC, TAC, TT, ThetaT] = ThetaConvergence(C, G, M, S, K, r ,q, tau,  n1, p)


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
    MatPsi = zeros(r1,t1,n1+1,n1+1,n1+1);       % Matpsi is defined as zero five dimensional matrix
    %theta1 = C*log(G*M)-(r-q)-2*C*Digamma(C*tau,p) + C*Digamma(C*tau+m,p)-2*C*Digamma(-1-2*C*tau-k-n-m,p)+C*Digamma(1-C*tau-n,p) + 2*C*log(-lo);
    
    for t = 1:t1
        for l = 1:r1
            for n = 0:n1
                for m = 0:n1
                    for k = 0:n1
                        %[l,t,n, m, k]
                        %Ma = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(-1 - 2*C*tau(t) -k-n-m) * (M^n) * (G^m) * (- lo(l,t) )^(1 + 2*C*tau(t) +k+n+m) / (gamma(1 - C*tau(t) -n)*factorial(n)*factorial(m));
                        Mat = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(-1 - 2*C*tau(t) -k-n-m) * (M^n) * (G^m) * (- lo(l,t) )^(1 + 2*C*tau(t) +k+n+m) / (gamma(1 - C*tau(t) -n)*factorial(n)*factorial(m));  % Mat(l,t,n+1,m+1,k+1) is defi
                        %MatCall = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(- 2*C*tau(t) -k-n-m) * (M^n) * (G^m) * (- lo(l,t) )^(2*C*tau(t) +k+n+m) / (gamma(1 - C*tau(t) -n)*factorial(n)*factorial(m));
                        %MatDelta = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(- 2*C*tau(t) -k-n-m) * (M^n) * (G^m) * (- lo(l,t) )^(2*C*tau(t) +k+n+m) / (gamma(1 - C*tau(t) -n)*factorial(n)*factorial(m)); % Mat(l,t,n+1,m+1,k+1) i
                        m11 = C*Digamma(C*tau+m,p)-2*C*Digamma(-1-2*C*tau-k-n-m,p)+C*Digamma(1-C*tau-n,p);
                        m12 = 2*C*log(-lo(l,t))+(1+2*C*tau+k+n+m)*(r-q-mu)/lo(l,t);    
                        MatPsi(l,t,n+1,m+1,k+1) = (m0 + m11 + m12)*Mat;
                        %theta1 = C*log(G*M)-(r-q)-2*C*Digamma(C*tau(t),p) + C*Digamma(C*tau(t)+m,p)-2*C*Digamma(-1-2*C*tau(t)-k-n-m,p)+C*Digamma(1-C*tau(t)-n,p) + 2*C*log(-(lo(l,t)));
                        %MatPsi(l,t,n+1,m+1,k+1) = (theta1(l,t)*MatCall + (r-q-mu)*MatDelta);
                        [S 1 n m k t l]
                    end
                end
            end
        end
    end


    NatPsi = zeros(r1,t1,n1+1,n1+1,n1+1);
    %Nat2 = zeros(r1,t1,n1+1,m1+1,k1+1);
    for n = 0:n1
        for m = 0:n1
            for  k = 0:n1
                for t = 1:t1
                    for l = 1:r1
                        %Nat = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(1 + 2*C*tau(t) +k-n+m) * (M^(-1-2*C*tau(t)+n-k-m)) * (G^m) * (- lo(l,t))^n / (gamma(2 + C*tau(t) -n+k+m)*factorial(n)*factorial(m));
                        Nat = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(1 + 2*C*tau(t) +k-n+m) * (M^(-1-2*C*tau(t)+n-k-m)) * (G^m) * (- lo(l,t))^n / (gamma(2 + C*tau(t) -n+k+m)*factorial(n)*factorial(m));
                        %NatDelta= ((-1)^m) * gamma(C*tau(t) + m) * gamma( 2*C*tau(t) +k-n+m) * (M^(-2*C*tau(t)+n-k-m)) * (G^m) * (lo(l,t))^n / (gamma(1 + C*tau(t) -n+k+m)*factorial(n)*factorial(m));  % Nat(l,t,n+1,m+1,k+1) is defined as 
                        m21 = C*Digamma(C*tau+m,p)+2*C*Digamma(1+2*C*tau+k-n+m,p)-C*Digamma(2+C*tau+k-n+m,p);
                        %m22 = n*(r-q-mu)/lo(l,t)-2*C*log(M);
                        m22 = -2*C*log(M) + n*(r-q-mu)/lo(l,t);
                        %theta2= C*log(G*M)-(r-q)-2*C*Digamma(C*tau,p)+C*Digamma(C*tau+m,p)+2*C*Digamma(1+2*C*tau+k-n+m,p)-C*Digamma(2+C*tau+k-n+m,p)-2*C*log(M);
                        %NatPsi(l,t,n+1,m+1,k+1)= (m0 + m21 + m22)*Nat;
                        NatPsi(l,t,n+1,m+1,k+1)= (m0 + m21 + m22)*Nat;
                        %Nat2(l,t,n+1,m+1,k+1) = ((-1)^m) * gamma(C*tau(t) + m) * gamma( 2*C*tau(t) +k-n+m) * (M^(-2*C*tau(t)+n-k-m)) * (G^m) * (lo(l,t))^n / (gamma(1 + C*tau(t) -n+k+m)*factorial(n)*factorial(m));
                        [S 2 n m k t l]
                    end
                end
            end
        end
    end


    KatPsi = zeros(r1,t1,n1+1,n1+1,n1+1);
    %Kat2 = zeros(r1,t1,n1+1,m1+1,k1+1);
    for n = 0:n1
        for m = 0:n1
            for  k = 0:n1
                for t = 1:t1
                    for l = 1:r1
                        %Kat(n+1,m+1,k+1) = ((-1)^m) * gamma(C*tau + n) * gamma(C*tau + m) * (M^(-n-C*tau)) * (G^m) * (lo^(1+C*tau+k+m-n)) / (gamma(2 + 2*C*tau +k+n+m)*factorial(n)*factorial(m));
                        if (lo(l,t) > 0)
                            Kat = ((-1)^(C*tau(t) + m)) * gamma(C*tau(t) + n) * gamma(C*tau(t) + m) * (M^n) * (G^m) * ((lo(l,t))^(1 + 2*C*tau(t) +k+m+n)) / (gamma(2 + 2*C*tau(t) +k+n+m)*factorial(n)*factorial(m)); % if [log] > 0 Kat(l,t,n+1,m+1,k+1)
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
    

    ThetaT =    real( - K .* ((G*M).^(C*tau)) .* exp( -(r-q)*tau) .* (MatPsi + NatPsi + KatPsi) ./ ((gamma(C*tau)).^2));
    %COPT =    real( K .* ((G*M).^(C*tau)) .* exp( -(r-q)*tau) .* (Mat + Nat + Kat) ./ ((gamma(C*tau)).^2));  % COPT is defined as the five dimensional matrix for the terms of the triple sum
                                                                                                            % series formula for an European Call Option formula for each element of K and tau
    
    TT = zeros(r1,t1,n1+1,3);   % CC is defined as a three dimensional zero matrix
    
    for n = 1:n1+1
        for j = 1:n
            for k = 1:n
                TT(:,:,n,1) = TT(:,:,n,1) + ThetaT(:,:,n,j,k); % CC(:,:,:,1) is defined as the double sum series value matrix, for each K and tau element, when n is constant
                TT(:,:,n,2) = TT(:,:,n,2) + ThetaT(:,:,j,n,k); % CC(:,:,:,2) is defined as the double sum series value matrix, for each K and tau element, when m is constant
                TT(:,:,n,3) = TT(:,:,n,3) + ThetaT(:,:,j,k,n); % CC(:,:,:,3) is defined as the double sum series value matrix, for each K and tau element, when k is constant
            end
        end
    end
    
    TeC =permute(sqrt(sum(sum(TT.^2,2),1)),[3 4 1 2]);
    TEC = vpa([0:n1 ; TeC']',8);                                % CEC is defined as the matrix with the values of the double sum series after applying the euclidean metric for all 189 cases
    TaC = permute(sum(sum(abs(TT),2),1),[3 4 1 2]);             
    TAC = vpa([0:n1 ; TaC']',8);    

end