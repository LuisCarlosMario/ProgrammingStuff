K = 1050;
S0 = 1000;
C = [13.727030 33.175661 52.846893];
r = 0.19;
q = 0.05;
t = 0.25;
sig = 0.212;
sig0 = 0.15;
tol = 0.0000001;
maxIterations = 1000;


C1 = BlackScholesSolution(K, S0, r, q, t, sig)

[K, sig] = ImpliedVolatility (C, K, S0, r , q, t, sig0, tol, maxIterations);

sig

BlackScholesSolution(K, S0, r, q, t, sig)