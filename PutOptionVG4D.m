function [lo,POP,mu] = PutOptionVG4D(C, G, M, S, K, r ,q, tau,  n1, m1,k1)

[lo,COP,mu] = CallOptionVG4D(C, G, M, S, K, r ,q, tau,  n1, m1,k1)

POP = COP - (S - K*exp(-tau*(r-q)));

end