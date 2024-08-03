function [EucN, EucM, EucK, AbsN, AbsM, AbsK, Abs, Res, M1, mu, lo] = ConvergenceVG444D(C, G, M, S, K, r ,q, tau,  n1)
    
    % Inputs:
    % C - parameter C of the Variance Gamma process
    % G - parameter G of the Variance Gamma process
    % M - parameter M of the Variance Gamma process
    % S - initial stock price value
    % K - strike price vector
    % r - risk free rate of return
    % q - dividend rate on r
    % tau - time to maturity vector
    % n1 - number of sums on both variables of the double sum series
    
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
    Mat = zeros(r1,t1,n1+1,n1+1,n1+1);      % Mat is defined as zero five dimensional matrix
    
    % The values of the terms in C^1_VG for each strike price (in vector K)
    % each time to maturnity (in vector tau) and values between 1 and n1, 1
    % and m,1 and 1 and k1, are computed in the following 5 "for" loops
    
    for t = 1:t1
        for l = 1:r1
            for n = 0:n1
                for m = 0:n1
                    for k = 0:n1
                        Mat(l,t,n+1,m+1,k+1) = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(-1 - 2*C*tau(t) -k-n-m) * (M^n) * (G^m) * (- lo(l,t) )^(1 + 2*C*tau(t) +k+n+m) / (gamma(1 - C*tau(t) -n)*factorial(n)*factorial(m));  % Mat(l,t,n+1,m+1,k+1) is defined as the value of the term in C^1_VG for 
                    end                                                                                                                                                                                                         % the corresponding K(l), tau(t), n, m and k computed according to the formula   
                end
            end
        end
    end

    
    Nat = zeros(r1,t1,n1+1,n1+1,n1+1);  % Nat is defined as zero five dimensional matrix
    
    % The values of the terms in C^2_VG for each strike price (in vector K)
    % each time to maturnity (in vector tau) and values between 1 and n1, 1
    % and m,1 and 1 and k1, are computed in the following 5 "for" loops
    
    for t = 1:t1
        for l = 1:r1
            for n = 0:n1
                for m = 0:n1
                    for k = 0:n1
                        Nat(l,t,n+1,m+1,k+1) = ((-1)^(n+m)) * gamma(C*tau(t) + m) * gamma(1 + 2*C*tau(t) +k-n+m) * (M^(-1-2*C*tau(t)+n-k-m)) * (G^m) * (- lo(l,t))^n / (gamma(2 + C*tau(t) -n+k+m)*factorial(n)*factorial(m));  % Nat(l,t,n+1,m+1,k+1) is defined as the value of the term in C^2_VG for 
                    end                                                                                                                                                                                                         % the corresponding K(l), tau(t), n, m and k computed according to the formula
                end
            end
        end
    end

    Kat = zeros(r1,t1, n1+1, n1+1,n1+1);   % Kat is defined as zero five dimensional matrix
    
    % The values of the terms in C^3_VG for each strike price (in vector K)
    % each time to maturnity (in vector tau) and values between 1 and n1, 1
    % and m,1 and 1 and k1, are computedin the following 5 "for" loops
    
    for t = 1:t1
        for l = 1:r1
            for n = 0:n1
                for m = 0:n1
                    for k = 0:n1
                        if  (lo(l,t) > 0)
                            Kat(l,t,n+1,m+1,k+1) = ((-1)^(C*tau(t) + m)) * gamma(C*tau(t) + n) * gamma(C*tau(t) + m) * (M^n) * (G^m) * ((lo(l,t))^(1 + 2*C*tau(t) +k+m+n)) / (gamma(2 + 2*C*tau(t) +k+n+m)*factorial(n)*factorial(m));  % if [log] > 0 Kat(l,t,n+1,m+1,k+1) is defined as the value of the term in C^3_VG for 
                        else
                            Kat(l,t,n+1,m+1,k+1) = 0;
                        end
                    end                                                                                                                                                                                                                 % the corresponding K(l), tau(t), n, m and k computed according to the formula 
                end                                                                                                                                                                                                                     % else if [log] < 0 Kat(l,t,n+1,m+1,k+1) is defined as 0
            end
        end
    end 

    M1 = zeros(n1+1, n1+1,n1+1,r1,t1);  % M1 is defined as zero five dimensional matrix

    Nen = zeros(n1+1,n1+1,n1+1);
    Men = zeros(n1+1,n1+1,n1+1);
    Ken = zeros(n1+1,n1+1,n1+1);
    Nan = zeros(n1+1,n1+1,n1+1);
    Man = zeros(n1+1,n1+1,n1+1);
    Kan = zeros(n1+1,n1+1,n1+1);    
    
    for n = 0:n1
        for m = 0:n
            for k = 0:n
                for t = 1:t1
                    for l = 1:r1
                        M1(n+1,m+1,k+1,l,t) = real( K(l) * ((G*M)^(C*tau(t))) * exp( -(r-q)*tau(t)) * (Mat(l,t,n+1,m+1,k+1) + Nat(l,t,n+1,m+1,k+1) + Kat(l,t,n+1,m+1,k+1)) / ((gamma(C*tau(t)))^2));    % Tha matrix for the value of each term of the triple sum series formula is computed
                    end
                end
                Nen(n+1,m+1,k+1) = sqrt(sum(M1(n+1,m+1,k+1,:,:).^2,'all'));
                Nan(n+1,m+1,k+1) = sum(abs(M1(n+1,m+1,k+1,:,:)),'all');
                %Nx(n+1) = Nx(n+1)+ sqrt(sum(M1(n+1,m+1,k+1,:,:).^2,'all'));
                %Ny(m+1) = Ny(m+1)+ sqrt(sum(M1(n+1,m+1,k+1,:,:).^2,'all'));
                %Ny(k+1) = Ny(k+1)+ sqrt(sum(M1(n+1,m+1,k+1,:,:).^2,'all'));
                %M2 = real( K .* ((G*M).^(C*tau)) .* exp( -(r-q)*tau) .* (Mat(:,:,n+1,m+1,k+1) + Nat(:,:,n+1,m+1,k+1) + Kat(:,:,n+1,m+1,k+1)) ./ ((gamma(C*tau)).^2));
                %Res(n+1,m+1,k+1) = sqrt(sum(M2.^2,'all'));
                %Abs(n+1,m+1,k+1) = sum(abs(M2),'all');
            end
        end
        NSa(n+1) = sum(Nan(n+1,:,:),'all');
        NSe(n+1) = sum(Nen(n+1,:,:),'all');
    end
    
    for m = 0:n1
        for n = 0:m
            for k = 0:m
                for t = 1:t1
                    for l = 1:r1
                        M1(n+1,m+1,k+1,l,t) = real( K(l) * ((G*M)^(C*tau(t))) * exp( -(r-q)*tau(t)) * (Mat(l,t,n+1,m+1,k+1) + Nat(l,t,n+1,m+1,k+1) + Kat(l,t,n+1,m+1,k+1)) / ((gamma(C*tau(t)))^2));    % Tha matrix for the value of each term of the triple sum series formula is computed
                    end
                end
                Men(n+1,m+1,k+1) = sqrt(sum(M1(n+1,m+1,k+1,:,:).^2,'all'));
                Man(n+1,m+1,k+1) = sum(abs(M1(n+1,m+1,k+1,:,:)),'all');
                %Nx(n+1) = Nx(n+1)+ sqrt(sum(M1(n+1,m+1,k+1,:,:).^2,'all'));
                %Ny(m+1) = Ny(m+1)+ sqrt(sum(M1(n+1,m+1,k+1,:,:).^2,'all'));
                %Ny(k+1) = Ny(k+1)+ sqrt(sum(M1(n+1,m+1,k+1,:,:).^2,'all'));
                %M2 = real( K .* ((G*M).^(C*tau)) .* exp( -(r-q)*tau) .* (Mat(:,:,n+1,m+1,k+1) + Nat(:,:,n+1,m+1,k+1) + Kat(:,:,n+1,m+1,k+1)) ./ ((gamma(C*tau)).^2));
                %Res(n+1,m+1,k+1) = sqrt(sum(M2.^2,'all'));
                %Abs(n+1,m+1,k+1) = sum(abs(M2),'all');
            end
        end
        MSa(m+1) = sum(Man(:,m+1,:),'all');
        MSe(m+1) = sum(Men(:,m+1,:),'all');
    end
    
    for k = 0:n1
        for n = 0:k
            for m = 0:k
                for t = 1:t1
                    for l = 1:r1
                        M1(n+1,m+1,k+1,l,t) = real( K(l) * ((G*M)^(C*tau(t))) * exp( -(r-q)*tau(t)) * (Mat(l,t,n+1,m+1,k+1) + Nat(l,t,n+1,m+1,k+1) + Kat(l,t,n+1,m+1,k+1)) / ((gamma(C*tau(t)))^2));    % Tha matrix for the value of each term of the triple sum series formula is computed
                    end
                end
                Ken(n+1,m+1,k+1) = sqrt(sum(M1(n+1,m+1,k+1,:,:).^2,'all'));
                Kan(n+1,m+1,k+1) = sum(abs(M1(n+1,m+1,k+1,:,:)),'all');
                %Nx(n+1) = Nx(n+1)+ sqrt(sum(M1(n+1,m+1,k+1,:,:).^2,'all'));
                %Ny(m+1) = Ny(m+1)+ sqrt(sum(M1(n+1,m+1,k+1,:,:).^2,'all'));
                %Ny(k+1) = Ny(k+1)+ sqrt(sum(M1(n+1,m+1,k+1,:,:).^2,'all'));
                %M2 = real( K .* ((G*M).^(C*tau)) .* exp( -(r-q)*tau) .* (Mat(:,:,n+1,m+1,k+1) + Nat(:,:,n+1,m+1,k+1) + Kat(:,:,n+1,m+1,k+1)) ./ ((gamma(C*tau)).^2));
                %Res(n+1,m+1,k+1) = sqrt(sum(M2.^2,'all'));
                %Abs(n+1,m+1,k+1) = sum(abs(M2),'all');
            end
        end
        KSa(k+1) = sum(Kan(:,:,k+1),'all');
        KSe(k+1) = sum(Ken(:,:,k+1),'all');
    end
    
    EucN = vpa(NSe,6)';
    EucM = vpa(MSe,6)';
    EucK = vpa(KSe,6)';
    AbsN = vpa(NSa,6)';
    AbsM = vpa(MSa,6)';
    AbsK = vpa(KSa,6)';
    Abs = 
end