function [K,COP,mu] = CallOptionGTS1Sum(cp, alphap, lambdap, lambdam, S, K, r, q, tau,  n1, m1)
    
    %CGMYCharacteristicFunction(u, C, G, M, Y)
    mu = log(CGMYCharacteristicFunction(-i, cp, lambdam, lambdap, alphap));
    %mu = log(VGCharacteristicFunction(-i, cp, lambdam, lambdap));
    
    lo = log(S/K) + (r-q)*tau;
 
    Trap = zeros(n1+1,m1+1);
    
    for n = 0:n1
        for m = 0:m1
            Trap(n+1,m+1) = ((-1)^n)*gamma(-n-alphap)*(lambdap^(alphap+n))*((-lo+ mu*tau)^(2+m+2*n)) / (factorial(n)*factorial(m+2));
            %[n m]
            %K*cp*exp(-(r-q)*tau)*Rat(n+1,m+1)
        end
    end
    3
    Trap(1,1) = 0;
    K*cp*exp(-(r-q)*tau)*(sum(sum(Trap)))    
    Rat = zeros(n1+1,m1+1);
    
    for n = 0:n1
        for m = 0:m1
            Rat(n+1,m+1) = ((-1)^m)*gamma(-n-alphap)*(lambdap^(alphap+n))*((-lo+ mu*tau)^(1+m+2*n)) / (factorial(n)*factorial(m));
            %[n m]
            %K*cp*exp(-(r-q)*tau)*Rat(n+1,m+1)
        end
    end
    0
    K*cp*exp(-(r-q)*tau)*(sum(sum(Rat)))    
    
    Mat = zeros(n1+1,m1+1);
    
    for n = 0:n1
        for m = 0:m1
            Mat(n+1,m+1) = ((-1)^n)*gamma(m-alphap)*(lambdap^(alphap-m))*((-lo+ mu*tau)^n) / (factorial(n)*factorial(m));
            %[n m]
            %K*cp*exp(-(r-q)*tau)*Mat(n+1,m+1)
        end
    end
    %Mat(1,1)
    Mat(1,1) = 0;
    5
    K*cp*exp(-(r-q)*tau)*(sum(sum(Mat)))
    %Mat(1,1)
    Nat = zeros(n1+1,m1+1);
    for n = 0:n1
        for m = 0:m1
            Nat(n+1,m+1) = gamma(alphap -n-m-1)*((-lambdap)^n)*((-lo+ mu*tau)^(1-alphap+n+m)) / (factorial(n)*gamma(alphap-n+1));
            %[n m]
            %K*cp*exp(-(r-q)*tau)*Nat(n+1,m+1)
        end
    end    
    K*cp*exp(-(r-q)*tau)*(sum(sum(Nat)))
    COP = K*cp*exp(-(r-q)*tau)*(sum(sum(Mat)) + sum(sum(Nat)));
end