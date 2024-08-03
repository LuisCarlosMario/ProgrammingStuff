% General Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;

% Parameters for the Monte Carlo Simulation:
dt=0.0001;
ite = 10000;

% Parameters for the Variance Gamma Formula:
n=10;
m=10;
k=10;

% Time to Maturity:
tau1= [(30 - 18)/365, (7-6)/12+ (30 - 18)/365, (7-3)/12+ (30 - 18)/365, (7)/12+ (30 - 18)/365, (7+3)/12+ (30 - 18)/365, (7+6)/12+ (30 - 18)/365, (7+12)/12+ (30 - 18)/365];
tau= (7-4)/12+ (30 - 18)/365;

% Strike Prices:
K = 1110;
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
K2=[975; 995; 1025; 1050];


% Values for the formula for the Call Option under the Variace Gamma Model:
% Formula for one Strike Price and Time to Maturity:
[K,CC,mu] = CallOptionVG3D(C, G, M, S0, K, r ,q, tau,  n, m,k);
CC
% Formula for multiple Strike Prices and one Time to Maturities:
[K1,COP,mu] = CallOptionVG4D(C, G, M, S0, K1, r ,q, tau1,  n, m,k);
COP
% Formula for multiple Strike Prices and one Time to Maturities:
S1 = [1100, 1124.47, 1200];
[K2,CCP,mu] = CallOptionVG5D(C, G, M, S1, K1, r ,q, tau1,  n, m,k);
CCP(:,:,2)
CCP(:,:,1)
CCP(:,:,3)

% Values for the Monte Carlo Simulation
%[K2,C1] = CallOptionVG2(C, G, M, S0, K2, r ,q, tau, dt, ite);
%C1

%% Call Option

% General Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;
%S0 = 1124.47;
r = 0.019;
q = 0.012;

% Parameters for the Monte Carlo Simulation:
dt=0.0001;
ite = 10000;

% Parameters for the Variance Gamma Formula:
n=30;
m=30;
k=30;

% Time to Maturity:
tau= 7/12+ (30 - 18)/365;

% Strike Prices:
S = 500:5:2000;
K = 1025;


% Values for the formula for the Call Option under the Variace Gamma Model:
% Formula for one Strike Price and Time to Maturity:
%[K2,CCP,mu] = CallOptionVG5D(C, G, M, S, K, r ,q, tau,  n, m,k);
[K2,CCP,mu] = DeltaCallVG5D(C, G, M, S, K, r ,q, tau,  n, m,k);
V=permute(CCP,[3,2,1]);
V



%Plot:
figure;
hold on
grid on
plot(S,V,'b','LineWidth',0.1);
xlabel 'time';
ylabel 'variance gamma values';
title 'One path simulation for a Variance Gamma Process';
hold off


%% CALL OPTION VALUES FOR VARIANCE GAMMA %%

% Values:
S0 = 1124.47;
S= 5:5:4000;
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;
sig=0.1812;
dt=0.0001;
K = 1025;

% Call Option computation:
COP = BlackScholesSolution(K, S, r, q, t, sig);
%mean(MM,3)
COP
%SS0
% Plot of the Call Option Values:
figure;
hold on
grid on
plot(S, COP, 'b');
xlabel 'Strike Price (USD)';
ylabel 'Value (USD)';
title 'European Call Option Price for the S&P500 under Variance Gamma';
hold off

%% GREEKS

% General Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;

% Parameters for the Monte Carlo Simulation:
dt=0.0001;
ite = 10000;

% Parameters for the Variance Gamma Formula:
n=10;
m=10;
k=10;

% Time to Maturity:
tau1= [(30 - 18)/365, (7-6)/12+ (30 - 18)/365, (7-3)/12+ (30 - 18)/365, (7)/12+ (30 - 18)/365, (7+3)/12+ (30 - 18)/365, (7+6)/12+ (30 - 18)/365, (7+12)/12+ (30 - 18)/365];
tau= (7-4)/12+ (30 - 18)/365;

% Strike Prices:
K = 1110;
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
K2=[975; 995; 1025; 1050];


% Values for the formula for the Call Option under the Variace Gamma Model:
% Formula for multiple Strike Prices and one Time to Maturities:
[K,D,mu] = DeltaVG4D(C, G, M, S0, K1, r ,q, tau1,  n, m,k);
D

K = 1110;
S1=5:5:1800;
[Kl,D1,mu] = DeltaVG4D(C, G, M, S1, K, r ,q, tau,  n, m,k);
D1