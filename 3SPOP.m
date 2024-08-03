%% Strike Price - Call Price %%


C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;
dt=0.0001;
Kmin = 975;
dK = 5;
Kmax = 1275;
ite = 1000;

[K,COP] = VarianceGammaOptionValues(C, G, M, S0, Kmin, dK, Kmax, r ,q, t, dt, ite);

K
COP

figure;
hold on
plot(K, COP, 'r');
xlabel 'Strike Price';
ylabel 'Option Price';
title 'Option Price';
hold off

[K, sig] = ImpliedVolatility (COP, K, S0, r , q, t, sig0, tol, maxIterations);

figure;
hold on
plot(K, sig, 'r');
xlabel 'Strike Price';
ylabel 'Volatility';
title 'ZZZZ';
hold off


