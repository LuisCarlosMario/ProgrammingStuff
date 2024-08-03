%% STOCK PRICE %%

%% VARIANCE GAMMA %%

C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;
dt=0.0001;

[T,S] = VarianceGammaStockPrice(C, G, M, S0, r, q, t, dt);

figure;
hold on
plot(T,S, 'r');
xlabel 'Time';
ylabel 'Stock Price';
title 'Stock Price';
hold off

%% VARIANCE GAMMA STOCHASTIC VOLATILITY %%

C = 11.9896;
G = 25.8523;
M = 35.5344;
k = 0.6020;
eta = 1.5560;
lambda = 1.9992;
y0 = 1;


S0 = 1124.47;
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;
dt=0.000001;

[T,S] = VarianceGammaStockPrice(C, G, M, S0, r, q, t, dt);

figure;
hold on
plot(T,S, 'r');
xlabel 'Time';
ylabel 'Stock Price';
title 'Stock Price';
hold off
