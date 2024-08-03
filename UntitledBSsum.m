q=0;
r=0.01;
S=3700;
K=4000;
tau=1;
sig=0.25;

n = 10;
m = 10;

C = BlackScholesSolution(K, S, r, q, tau, sig);
[K,COP] = CallOptionSumBS(sig, S, K, r,tau, n, m);
K
C
COP