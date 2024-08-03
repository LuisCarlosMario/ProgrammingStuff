%%TEST With Variance Gamma%%

S0=1;
r = 1;
q = 0;
C = 11.9896;
G = 25.8523;
M = 35.5344;
k = 0.6020;
eta = 1.5560;
lambda = 1.9992;
y0 = 1;
t = 1;
dt = 0.0001;


[T,S] = StockPrice(S0,r,q, C, G, M, k, eta, lambda, y0, t, dt);

figure;
hold on
plot(T, S, 'g');
xlabel 'Time';
ylabel 'Values';
title 'Variance Gamma Stochastic Volatility';
hold off

n=10000;

[T2,X2] = VarianceGamma2(C, G, M, t, n);

figure;
hold on
plot(T2, X2, 'r');
xlabel 'Time';
ylabel 'Poisson Process';
title 'Variance Gamma';
hold off