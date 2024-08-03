%% Call Option Price TEST %%


C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;
dt=0.0001;
Kmin = 1100;
dK = 5;
Kmax = 1100;
ite = 10000;

[K,COP] = VarianceGammaOptionValues(C, G, M, S0, Kmin, dK, Kmax, r ,q, t, dt, ite);

COP