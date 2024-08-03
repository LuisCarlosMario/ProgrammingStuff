%% 6.3. C vs P

% General Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
sig = 0.1812;
%S1 = 1000:10:1600;
%S = [1000 1100 1200 1300 1400 1500 1600];
%S = 200:5:4000;
S = 500:5:4000;
r = 0.019;
q = 0.012;

% Parameters for the Monte Carlo Simulation:
dt=0.0001;
ite = 10000;

% Parameters for the Variance Gamma Formula:
n=58;
m=31;
k=11;
%n=70;
%m=45;
%k=30;
%n=30;
%m=30;
%k=30;

% Time to Maturity:
%tau= (7-4)/12+ (30 - 18)/365;
tau = 7/12 + (30 - 18)/365;

% Strike Prices:
K = 1110;




% Values for the formula for the Call Option under the Variace Gamma Model:
% Formula for one Strike Price and Time to Maturity:

%[K,C1,mu] = CallOptionVG5D(C, G, M, S1, K1, r ,q, tau1,  n, m,k);
[CBS, PBS, Delta, Gamma, Rho, Theta] = BlackScholes(S, K, r, q, tau, sig);
%CBS = BlackScholesSolution(K, S, r, q, tau, sig);
%PBS = BlackScholesPut(K, S, r, q, tau, sig);
CVGF = zeros(1,length(S));
PVGF = zeros(1,length(S));

for s =1:length(S)
    [COP,POP,lo,mu] = EuropeanOptionSumFormula(C, G, M, S(s), K, r ,q, tau, n, m,k);
    s
    %[K2,C1] = CallOptionVG2(C, G, M, S(s), K, r ,q, tau, dt, ite);
    CVGF(s) = COP;
    PVGF(s) = POP;
end


% Plot of the Call Option Values:
figure;
hold on
grid off
plot(S, CVGF,'b',S, CBS,'r--');
xlabel 'Asset Price (USD)';
ylabel 'Option Price (USD)';
title 'European Call Option Price Estimate for the S&P500';
legend({'Variance Gamma Formula','Brownian Motion'}, 'Location', 'NorthWest');
hold off

% Plot of the Call Option Values:
figure;
hold on
grid off
plot(S, PVGF,'b',S, PBS,'r--');
xlabel 'Asset Price (USD)';
ylabel 'Option Price (USD)';
title 'European Put Option Price Estimate for the S&P500';
legend({'Variance Gamma Formula','Brownian Motion'}, 'Location', 'NorthEast');
hold off

%% 6.3. P vs P

% General Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
sig = 0.1812;
%S1 = 1000:10:1600;
%S = [1000 1100 1200 1300 1400 1500 1600];
S = 200:5:4000;
r = 0.019;
q = 0.012;

% Parameters for the Monte Carlo Simulation:
dt=0.0001;
ite = 10000;

% Parameters for the Variance Gamma Formula:
%n=57;
%m=57;
%k=57;
n=70;
m=45;
k=30;

% Time to Maturity:
%tau= (7-4)/12+ (30 - 18)/365;
tau = 7/12 + (30 - 18)/365;

% Strike Prices:
K = 1110;


% Values for the formula for the Call Option under the Variace Gamma Model:
% Formula for one Strike Price and Time to Maturity:

%[K,C1,mu] = CallOptionVG5D(C, G, M, S1, K1, r ,q, tau1,  n, m,k);

PBS = BlackScholesPut(K, S, r, q, tau, sig);
PVGF = zeros(1,length(S));
PVGMC = zeros(1,length(S));
for s =1:length(S)
    [lo,POP,mu] = PutOptionVG4D(C, G, M, S(s), K, r ,q, tau, n, m, k);
    PVGF(s) = POP;
    s
    %[K2,C1] = CallOptionVG2(C, G, M, S(s), K, r ,q, tau, dt, ite);
    %CVGMC(s) = C1;
end


% Plot of the Call Option Values:
figure;
hold on
grid off
plot(S, PBS,'r',S, PVGF,'b');
xlabel 'Asset Price (USD)';
ylabel 'Option Price (USD)';
title 'European Put Option Price Estimate for the S&P500';
legend({'Brownian Motion','Variance Gamma Formula'}, 'Location', 'NorthWest');
hold off

% Plot of the Call Option Values:
%figure;
%hold on
%grid off
%plot(S, CBS,'r',S, CVGMC,'g',S, CVGF,'b');
%xlabel 'Asset Price (USD)';
%ylabel 'Option Price (USD)';
%title 'Estimate European Call Option Price for the S&P500';
%legend({'Brownian Motion', 'Variance Gamma Monte Carlo Simulation','Variance Gamma Formula'}, 'Location', 'NorthEast');
%hold off

%% Volatility Smile

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
tau= 7/12+ (30 - 18)/365;
dt=0.0001;
Kmin = 975;
dK = 5;
Kmax = 1275;
sig = 0.1812;
K = Kmin:dK:Kmax;
KData = [975 995 1025 1050 1075 1100 1125 1140 1150 1175 1200 1225 1250 1275];
Data = [173.30 157.00 133.10 114.80 97.60 81.20 66.90 58.90 53.90 42.50 33.00 24.90 18.30 13.20];
ite = 10000;
n2=20;
m2=23;
k2=6;
n1=30;
m1=30;
k1=30;
K1 = K';
[CC1,PP1,lo,mu] = EuropeanOptionSumFormula(C, G, M, S0, K1, r ,q, tau, n2, m2,k2);
CVGF = CC1';
% Call Option by Black-Scholes:
[CBS, PBS, Delta, Gamma, Rho, Theta] = BlackScholes(S0, K, r, q, tau, sig);
% Call Option by Variance Gamma:
CC2 = CallOptionVGRevenge(C, G, M, S0, K, r ,q, tau, dt, ite);
CVGMC = CC2';
% Call Option by Variance Gamma with Stochastic Volatility



%Plot of the Call Option Values:
figure;
hold on;
grid off;
plot(K,CBS, 'r',K,CVGMC,'g', K, CVGF, 'b',KData,Data,'ko','LineWidth',0.1);
xlabel 'Strike Price (USD)';
ylabel 'Value (USD)';
title 'European Call Option Price for the S&P500';
legend({'Black Scholes', 'Variance Gamma Monte Carlo Simulation', 'Variance Gamma with Stochastic Volatility','Observed Prices'}, 'Location', 'NorthEast');
hold off

% Extra values:
sig0 = 0.5;
tol = 0.000001;
maxIterations = 1000;

% Implied Volatility for Black-Scholes:
sigBS = ImpliedVolatility (CBS, K, S0, r , q, tau, sig0, tol, maxIterations);
% Implied Volatility for Variance Gamma:
sigVGMC = ImpliedVolatility (CVGMC, K, S0, r , q, tau, sig0, tol, maxIterations);
% Implied Volatility for VGSV:
sigVGF = ImpliedVolatility (CVGF, K, S0, r , q, tau, sig0, tol, maxIterations);
% Implied Volatility for Empirical Results:
sigData = ImpliedVolatility (Data, KData, S0, r , q, tau, sig0, tol, maxIterations);


%Plot of the Implied Volatility:
figure;
hold on
grid off
plot(K, sigBS, 'r', K, sigVGMC,'g', K, sigVGF, 'b',KData,sigData,'ko','LineWidth',0.1);
xlabel 'Strike Price (USD)';
ylabel 'Volatility (USD)';
title 'Implied Volatility for each of the Processes';
legend({'Black Scholes', 'Variance Gamma Monte Carlo Simulation', 'Variance Gamma Formula','Observed Volatility'}, 'Location', 'NorthEast');
hold off
