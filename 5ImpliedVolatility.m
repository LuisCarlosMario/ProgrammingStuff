%% IMPLIED VOLATILITY %%

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
tol = 0.000001;
maxIterations = 1000;

[K,COP] = VarianceGammaOptionValues(C, G, M, S0, Kmin, dK, Kmax, r ,q, t, dt, ite);


[K, sig] = ImpliedVolatility (COP, K, S0, r , q, t, sig0, tol, maxIterations);

figure;
hold on
plot(K, sig, 'r');
xlabel 'Strike Price';
ylabel 'Implied Volatility';
title 'Implied Volatility for the Variance Gamma';
hold off

sig2 = 0.1812;
BS = BlackScholesSolution(K, S0, r, q, t, sig2);

[K, sig] = ImpliedVolatility (BS, K, S0, r , q, t, sig0, tol, maxIterations);


figure;
hold on
plot(K, sig, 'r');
xlabel 'Strike Price';
ylabel 'Implied Volatility';
title 'Implied Volatility for the Brownian Motion';
hold off

