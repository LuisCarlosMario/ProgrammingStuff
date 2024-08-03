C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1000;
r=0.03;
T=1;
alpha = 0.75;
eta = 1;
N = 10000;


[CP,K] = CallOptionPrice(C, G, M, S0, r, T, alpha, eta, N);

figure;
hold on
plot(CP, K, 'g');
xlabel 'strike';
ylabel 'option price';
title 'Option Prices for the Variance Gamma';
hold off

C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1000;
Kmax = 1500;
r=0.03;
T=1;
alpha = 0.75;
eta = 1;
N = 10000;


[CP,K] = CallOptionPrice2(C, G, M, S0, Kmax, r, T, alpha, N);

figure;
hold on
plot(CP, K, 'g');
xlabel 'strike';
ylabel 'option price';
title 'Option Prices for the Variance Gamma';
hold off
