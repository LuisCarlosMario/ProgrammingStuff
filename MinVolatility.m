function sig = MinVolatility (C, K, S0, r , q, tau, sig0, tol, maxIterations)


    %SC = size(C);
    %lenK = length(K);
    %lenT = length(T)
    sig = sig0;      
    V = Vega(K, S0, r , q, tau, sig); 
    V(C==0) = 0;
    v = sum(V,'all');
    f = tol;                       
    
    % the Newton method is applied:
    for i = 1:maxIterations
        if(abs(V) < tol)                                        % if all absolute values of V are smaller than tol the loop terminates
            return
        else
            i
            sig = sig - (f ./ (-v));
            V = Vega(K, S0, r, q, tau, sig);
            V(C==0) = 0;
            v = sum(V,'all');
            [C1, P1, D1, G1, R1, T1] = BlackScholes(S0, K, r, q, tau, sig);   % C1 is defined as the Black Scholes estimated Call Option value under the K, S0, r, q, t and sig parameters
            M = C - C1;
            M(C==0)=0;
            f = sum(M,'all');                                               % f is defined as the difference between the Call Option price C and C1
            if(abs(f) < tol)
                return
            end
        end
    end
end
