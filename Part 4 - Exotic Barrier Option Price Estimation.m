%% PART 4 - EXOTIC BARRIER OPTION PRICE ESTIMATION %%

%% BARRIER OPTION PRICE UNDER BROWNIAN MOTION WITH DRIFT %%


% Values:
S0 = 1124.47;
K = 1124.47;
H = S0 * (1:0.02:1.2);
r = 0.019;
q = 0.012;
t= 1;
dt=0.0001;
sig = 0.1812;
ite = 10000;

% Barrier Option Values computation:
BOP = BarrierOptionBM(sig, S0, K, H, r ,q, t, dt, ite);

% Barrier Option Values:
BOP

% Plot:
hold on;
grid on;
plot(H,BOP, 'ro','LineWidth',0.1);
xlabel 'Barrier Values (USD)';
ylabel 'Option Value (USD)';
title 'Up-and-in Barrier Option Price for the S&P500';
hold off

%% BARRIER OPTION PRICE UNDER VARIANCE GAMMA %%

% Values:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
K = 1124.47;
H = S0 * (1:0.02:1.2);
r = 0.019;
q = 0.012;
t= 1;
dt=0.0001;
ite = 10000;

% Barrier Option Values computation:
BOP = BarrierOptionVG(C, G, M, S0, K, H, r ,q, t, dt, ite);

% Barrier Option Values:
BOP

% Plot:
hold on;
grid on;
plot(H,BOP, 's','LineWidth',0.1);
xlabel 'Barrier Values (USD)';
ylabel 'Option Value (USD)';
title 'Up-and-in Barrier Option Price for the S&P500';
hold off


%% BARRIER OPTION PRICE UNDER VARIANCE GAMMA WITH STOCHASTIC VOLATILITY %%

% Values:
C = 11.9896;
G = 25.8523;
M = 35.5344;
k = 0.6020;
eta = 1.5560;
lambda = 1.9992;
y0 = 1;
S0 = 1124.47;
K = 1124.47;
H = S0 * (1:0.02:1.2);
r = 0.019;
q = 0.012;
t= 1;
dt=0.0001;
ite = 10000;


% Barrier Option Values computation:
BOP = BarrierOptionVGSV(C, G, M, k, eta, lambda, y0, S0, K, H, r ,q, t, dt, ite);

% Barrier Option values:
BOP

% Plot:
hold on;
grid on;
plot(H, BOP, 'g^','LineWidth',0.1);
xlabel 'Barrier Values (USD)';
ylabel 'Option Value (USD)';
title 'Up-and-in Barrier Option Price for the S&P500';
hold off

%% BARRIER OPTION PRICES FOR ALL THREE PROCESSES %%

% Values
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
S0 = 1124.47;
K = 1124.47;
H = S0 * (1:0.02:1.2);
r = 0.019;
q = 0.012;
t= 1;
dt=0.0001;
sig = 0.1812;
ite = 10000;

% Barrier Option Values Computation:
BBM = BarrierOptionBM(sig, S0, K, H, r ,q, t, dt, ite);
BVG = BarrierOptionVG(C, G, M, S0, K, H, r ,q, t, dt, ite);
BVGSV = BarrierOptionVGSV(Csv, Gsv, Msv, k, eta, lambda, y0, S0, K, H, r ,q, t, dt, ite);

% Barrier Option Values:
BBM
BVG
BVGSV

% Plot:
hold on;
grid on;
plot(H,BBM, 'ro',H,BVG,'s', H, BVGSV, 'g^','LineWidth',0.1);
xlabel 'Barrier Values (USD)';
ylabel 'Option Value (USD)';
title 'Up-and-in Barrier Option Price for the S&P500';
legend({'Black Scholes', 'Variance Gamma', 'Variance Gamma with Stochastic Volatility'}, 'Location', 'Southwest');
hold off