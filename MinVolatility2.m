function sig = MinVolatility2 (C, K, S0, r , q, tau, sig0, tol, maxIterations, sigInt)


    %SC = size(C);
    %lenK = length(K);
    %lenT = length(T)
    sig = sig0;      
    V = Vega(K, S0, r , q, tau, sig); 
    V(C==0) = 0;
    v = sum(V,'all');
    f = tol;    
    
                % computing df
            V2 = Vega(K, S0, r, q, tau, sig + sigInt);
            V1 = Vega(K, S0, r, q, tau, sig - sigInt);
            V2(C==0) = 0;
            V1(C==0) = 0;
            [C11, P1, D1, G1, R1, T1] = BlackScholes(S0, K, r, q, tau, sig- sigInt);   % C1 is defined as the Black Scholes estimated Call Option value under the K, S0, r, q, t and sig parameters
            M1 = V1.*(C - C11);
            M1(C==0)=0;
            f1 = sum(M1,'all');
            [C12, P1, D1, G1, R1, T1] = BlackScholes(S0, K, r, q, tau, sig+ sigInt);   % C1 is defined as the Black Scholes estimated Call Option value under the K, S0, r, q, t and sig parameters
            M2 = V1.*(C - C12);
            M2(C==0)=0;
            f2 = sum(M2,'all');
            df = (f2-f1)/ (2*sigInt);
    
    % the Newton method is applied:
    for i = 1:maxIterations
        if(abs(V) < tol)                                        % if all absolute values of V are smaller than tol the loop terminates
            return
        else
            i
            sig = sig - (f ./ df);
            
            % computing f
            V = Vega(K, S0, r, q, tau, sig);
            %V(C==0) = 0;
            %v = sum(V,'all');
            [C1, P1, D1, G1, R1, T1] = BlackScholes(S0, K, r, q, tau, sig);   % C1 is defined as the Black Scholes estimated Call Option value under the K, S0, r, q, t and sig parameters
            M = V.*(C - C1);
            M(C==0)=0;
            f = sum(M,'all');    
            
            
            % computing df
            V2 = Vega(K, S0, r, q, tau, sig + sigInt);
            V1 = Vega(K, S0, r, q, tau, sig - sigInt);
            %V2(C==0) = 0;
            %V1(C==0) = 0;
            [C11, P1, D1, G1, R1, T1] = BlackScholes(S0, K, r, q, tau, sig- sigInt);   % C1 is defined as the Black Scholes estimated Call Option value under the K, S0, r, q, t and sig parameters
            M1 = V1.*(C - C11);
            M1(C==0)=0;
            f1 = sum(M1,'all');
            [C12, P1, D1, G1, R1, T1] = BlackScholes(S0, K, r, q, tau, sig+ sigInt);   % C1 is defined as the Black Scholes estimated Call Option value under the K, S0, r, q, t and sig parameters
            M2 = V1.*(C - C12);
            M2(C==0)=0;
            f2 = sum(M2,'all');
            df = (f2-f1)/ (2*sigInt);
            if(abs(f) < tol)
                return
            end
        end
    end
end