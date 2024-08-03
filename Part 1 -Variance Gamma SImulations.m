%% CALL OPTION PRICE ESTIMATION %%

%% BLACK-SCHOLES FORMULA %%

% Values:
S0 = 1124.47;
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;
dt=0.0001;
K1 =[975;
    995;
    1025;
    1050;
    1075;
    1090;
    1100;
    1110;
    1120;
    1125;
    1130;
    1135;
    1140;
    1150;
    1160;
    1170;
    1175;
    1200;
    1225;
    1250;
    1275;
    1300;
    1325;
    1350;
    1400;
    1450;
    1500];
sig = 0.1812;
% Time to Maturity:
tau1= [(30 - 18)/365, (7-6)/12+ (30 - 18)/365, (7-3)/12+ (30 - 18)/365, (7)/12+ (30 - 18)/365, (7+3)/12+ (30 - 18)/365, (7+6)/12+ (30 - 18)/365, (7+12)/12+ (30 - 18)/365];

% Call Option Values computation:
C = BlackScholesSolution(K1, S0, r, q, tau1, sig);
C
% Plot of the Call Option Values:
figure;
hold on
grid on
plot(K1,C, 'r');
xlabel 'Strike Price (USD)';
ylabel 'Value (USD)';
title 'European Call Option Price for the S&P500 under Black Scholes';
hold off

% Extra values
sig0 = 0.5;
tol = 0.000001;
maxIterations = 1000;

% Implied Volatility:
[K, sig] = ImpliedVolatility (C, K1, S0, r , q, t, sig0, tol, maxIterations);

% Plot of the Implied Volatility:
figure;
hold on
grid on
plot(K, sig, 'r');
xlabel 'Strike Price (USD)';
ylabel 'Volatility (USD)';
title 'Implied Volatility under Black Scholes';
hold off


%% CALL OPTION VALUES FOR VARIANCE GAMMA %%

% Values:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;
dt=0.0001;
K1 =[975;
    995;
    1025;
    1050];
% Time to Maturity:
tau1= (7+3)/12+ (30 - 18)/365;

    
ite = 10000;

% Call Option computation:
[K,COP] = CallOptionVG2(C, G, M, S0, K1, r ,q, tau1, dt, ite);
K1
COP
% Plot of the Call Option Values:
figure;
hold on
grid on
plot(K1, COP, 'b');
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



%% CALL OPTION VALUES FOR VARIANCE GAMMA WITH STOCHASTIC VOLATILITY %%

% Values:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;
dt=0.0001;
K1 =[975;
    995;
    1025;
    1050;
    1075;
    1090;
    1100;
    1110;
    1120;
    1125;
    1130;
    1135;
    1140;
    1150;
    1160;
    1170;
    1175;
    1200;
    1225;
    1250;
    1275;
    1300;
    1325;
    1350;
    1400;
    1450;
    1500];
% Parameters for the Variance Gamma Formula:
n=10;
m=10;
k=10;
% Time to Maturity:
tau1= [(30 - 18)/365, (7-6)/12+ (30 - 18)/365, (7-3)/12+ (30 - 18)/365, (7)/12+ (30 - 18)/365, (7+3)/12+ (30 - 18)/365, (7+6)/12+ (30 - 18)/365, (7+12)/12+ (30 - 18)/365];
tau= (7)/12+ (30 - 18)/365;

% Call Option computation:
[K1,COP,mu] = CallOptionVG4D(C, G, M, S0, K1, r ,q, tau1,  n, m,k);
K1
COP;
% Plot of the Call Option Values:
figure;
hold on
grid on
plot(K1, COP, 'b');
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

%% CALL OPTION VALUES FOR THE THREE PROCESSES %%

% Values:
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
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;
dt=0.0001;
Kmin = 975;
dK = 5;
Kmax = 1275;
sig = 0.1812;
K = Kmin:dK:Kmax;
KData = [975 995 1025 1050 1075 1100 1125 1140 1150 1175 1200 1225 1250 1275];
Data = [173.30 157.00 133.10 114.80 97.60 81.20 66.90 58.90 53.90 42.50 33.00 24.90 18.30 13.20];
ite = 10000;

% Call Option by Black-Scholes:
CBS = BlackScholesSolution(K, S0, r, q, t, sig);
% Call Option by Variance Gamma:
[K,CVG] = CallOptionVG(C, G, M, S0, Kmin, dK, Kmax, r ,q, t, dt, ite);
% Call Option by Variance Gamma with Stochastic Volatility
[K,CVGSV] = CallOptionVGSV(C, G, M, k, eta, lambda, y0, S0, Kmin, dK, Kmax, r ,q, t, dt, ite);


%Plot of the Call Option Values:
figure;
hold on;
grid on;
plot(K,CBS, 'r',K,CVG,'b', K, CVGSV, 'g',KData,Data,'ko','LineWidth',0.1);
xlabel 'Strike Price (USD)';
ylabel 'Value (USD)';
title 'European Call Option Price for the S&P500';
legend({'Black Scholes', 'Variance Gamma', 'Variance Gamma with Stochastic Volatility','Observed Prices'}, 'Location', 'NorthEast');
hold off

% Extra values:
sig0 = 0.5;
tol = 0.000001;
maxIterations = 1000;

% Implied Volatility for Black-Scholes:
[K, sigBS] = ImpliedVolatility (CBS, K, S0, r , q, t, sig0, tol, maxIterations);
% Implied Volatility for Variance Gamma:
[K, sigVG] = ImpliedVolatility (CVG, K, S0, r , q, t, sig0, tol, maxIterations);
% Implied Volatility for VGSV:
[K, sigVGSV] = ImpliedVolatility (CVGSV, K, S0, r , q, t, sig0, tol, maxIterations);
% Implied Volatility for Empirical Results:
[KData, sigData] = ImpliedVolatility (Data, KData, S0, r , q, t, sig0, tol, maxIterations);


%Plot of the Implied Volatility:
figure;
hold on
grid on
plot(K, sigBS, 'r', K, sigVG,'b', K, sigVGSV, 'g',KData,sigData,'ko','LineWidth',0.1);
xlabel 'Strike Price (USD)';
ylabel 'Volatility (USD)';
title 'Implied Volatility for each of the Processes';
legend({'Black Scholes', 'Variance Gamma', 'Variance Gamma with Stochastic Volatility','Observed Volatility'}, 'Location', 'NorthEast');
hold off
