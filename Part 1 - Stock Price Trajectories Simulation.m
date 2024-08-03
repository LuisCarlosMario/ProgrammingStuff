%% PART 1 (EXTRA) - STOCK PRICE TRAJECTORIES SIMULATIONS %%


%% STOCK PRICE SIMULATION UNDER BROWNIAN MOTION %%

% Values:
S0 = 1124.47;
r = 0.019;
q = 0.012;
sig = 0.1812;
t= 1;
dt=0.0001;

%Simulation:
[T,S] = StockPriceBM(S0, r ,q, sig, t, dt);

%Plot:
figure;
hold on
grid on
plot(T,S, 'y');
xlabel 'time (USD)';
ylabel 'stock price (USD)';
title 'Simulation of the value of the S&P500 using a Brownian Motion';
hold off


%% STOCK PRICE SIMULATION UNDER VARIANCE GAMMA %%

% Values
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
t= 1;
dt=0.001;

%Simulation:
[T,S] = StockPriceVG(C, G, M, S0, r ,q, t, dt);

%Plot:
figure;
hold on
grid on
plot(T,S,'b');
xlabel 'time (USD)';
ylabel 'stock price (USD)';
title 'Simulation of the value of the S&P500 using Variance Gamma';
hold off


%% STOCK PRICE SIMULATION UNDER VARIANCE GAMMA WITH STOCHASTIC VOLATILITY %%

% Values:
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
t = 1;
dt = 0.0001;

%Simulation:
[T,S] = StockPriceVGSV(C, G, M, k ,eta, lambda, y0, S0, r ,q, t, dt);

%Plot:
figure;
hold on;
grid on;
plot(T,S, 'r');
xlabel 'time (USD)';
ylabel 'stock value (USD)';
title 'Simulation of the value of the S&P500 using VGSV';
hold off


%% STOCK PRICE SIMULATION FOR ALL THREE PROCESSES %%

% Values:
S0 = 1124.47;
r = 0.019;
q = 0.012;
sig = 0.1812;
C = 1.3574;
G = 5.8704;
M = 14.2699;
Csv = 11.9896;
Gsv = 25.8523;
Msv = 35.5344;
k = 0.6020;
eta = 1.5560;
lambda = 1.9992;
y0 = 1;
t= 1;
dt=0.0001;

% Simulations:
[T,SBM] = StockPriceBM(S0, r ,q, sig, t, dt);
[T,SVG] = StockPriceVG(C, G, M, S0, r ,q, t, dt);
[T,SVGSV] = StockPriceVGSV(Csv, Gsv, Msv, k ,eta, lambda, y0, S0, r ,q, t, dt);

%Plots:
figure;
hold on
grid on
plot(T,SBM, 'y',T,SVG, 'b',T,SVGSV, 'r','LineWidth', 0.1 );
xlabel 'time (years)';
ylabel 'stock value (USD)';
title 'Simulation of the value of the S&P500';
legend({'Brownian Motion', 'Variance Gamma', 'VGSV'}, 'Location', 'NorthWest');
hold off


