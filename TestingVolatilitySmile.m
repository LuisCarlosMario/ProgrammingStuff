%% PART 2 - CALL OPTION PRICE ESTIMATION %%

%% BLACK-SCHOLES FORMULA %%

% Values:
S0 = 1124.47;
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;
dt=0.0001;
Kmin = 975;
dK = 5;
Kmax = 1275;
sig = 0.1812;
K = Kmin:dK:Kmax;

% Call Option Values computation:
C = BlackScholesSolution(K, S0, r, q, t, sig);

% Plot of the Call Option Values:
figure;
hold on
grid on
plot(K,C, 'r');
xlabel 'Strike Price (USD)';
ylabel 'Value (USD)';
title 'European Call Option Price for the S&P500 under Black Scholes';
hold off

% Extra values
sig0 = 0.5;
tol = 0.000001;
maxIterations = 1000;

% Implied Volatility:
[K, sig] = ImpliedVolatility (C, K, S0, r , q, t, sig0, tol, maxIterations);

% Plot of the Implied Volatility:
figure;
hold on
grid on
plot(K, sig, 'r');
xlabel 'Strike Price (USD)';
ylabel 'Volatility (USD)';
title 'Implied Volatility under Black Scholes';
hold off


%% CALL OPTION VALUES FOR THE VARIANCE GAMMA FORMULA %%

% Values:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;

axd = 25;
n = axd;
m = axd;
k = axd;

Kmin = 975;
dK = 5;
Kmax = 1500;
K = Kmin:dK:Kmax;
K1 = K';
% Call Option computation:
[K1,COP1,mu] = CallOptionVG4D(C, G, M, S0, K1, r ,q, t, n, m, k);
COP = COP1';
% Plot of the Call Option Values:
figure;
hold on
grid on
plot(K, COP, 'b');
xlabel 'Strike Price (USD)';
ylabel 'Value (USD)';
title 'European Call Option Price for the S&P500 under Variance Gamma';
hold off

% Extra values
sig0 = 0.5;
tol = 0.000001;
maxIterations = 1000;

% Implied Volatility:
[K, sig] = ImpliedVolatility (COP, K, S0, r , q, t, sig0, tol, maxIterations);

% Plot of the Implied Volatility
figure;
hold on
grid on
plot(K, sig, 'b');
xlabel 'Strike Price (USD)';
ylabel 'Volatility (USD)';
title 'Implied Volatility under Variance Gamma';
hold off


