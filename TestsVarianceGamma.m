%%TEST With Variance Gamma%%

C = 11.9896;
G = 25.8523;
M = 35.5344;
k = 0.6020;
eta = 1.5560;
lambda = 1.9992;
y0 = 1;
t = 1;
dt = 0.00001;

[T,X] = VGSV2(C, G, M, k, eta, lambda, y0, t, dt);

figure;
hold on
plot(T, X, 'g');
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