S = 3800;
K = 4000;
r = 0.01;
sig = 0.2;
tau = 1;
alp = 1.7;
gam = 0.9;
n0 = 9;
n = 9;
m = 19;

Mu(alp, gam, sig, n0)


[K,COP,mu] = CallOptionFMLS(alp, gam, sig, S, K, r,tau, n0, n, m);
K
mu
COP
