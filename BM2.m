function [A] = BM2(k)
%Brownian Motion Simulation
N = randn(k-1,1);
N
A = cumsum(N);
A
A [0, A];
A
A=sqrt(1/(k-1))*A;
A
end