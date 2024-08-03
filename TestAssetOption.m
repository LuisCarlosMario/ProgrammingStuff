tau1= [(30 - 18)/365, (7-6)/12+ (30 - 18)/365, (7-3)/12+ (30 - 18)/365, (7)/12+ (30 - 18)/365, (7+3)/12+ (30 - 18)/365, (7+6)/12+ (30 - 18)/365, (7+12)/12+ (30 - 18)/365];
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

% General Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
sig = 0.1812;
%S1 = 1000:10:1600;
%S1 = [1000 1100 1200 1300 1400 1500 1600];
S1 = 1000:25:1200;
S = 2000;
r = 0.019;
q = 0.012;

% Parameters for the Monte Carlo Simulation:
dt=0.0001;
ite = 10000;

% Parameters for the Variance Gamma Formula:
n=30;
m=30;
k=30;
ite = 10000;

% Time to Maturity:
tau= (7-4)/12+ (30 - 18)/365;
t = 7/12 + (30 - 18)/365;

% Strike Prices:
K = 1110;



% Values for the formula for the Call Option under the Variace Gamma Model:
% Formula for one Strike Price and Time to Maturity:
%[NN,K,TM,COP2,s] = CallOptionVGRevengeStock(C, G, M, S1, K, r ,q, tau, dt, ite);
%[K,COP,mu] = CallOptionVG5D(C, G, M, S1, K, r ,q, tau,  n, m,k);
%COP;
%C1 = permute(COP,[3,2,1]);
%C1;


%S = 1600;
[K,C2,mu] = VAPCallOptionVG5D(C, G, M, S1, K, r ,q, t,  n, m,k);
%[K,C2e,mu] = CallOptionVG5D(C, G, M, S1(end), K, r ,q, tau,  n, m,k);
[NN,K,TM,COP2,s] = CallOptionVGRevengeStock(C, G, M, S1, K, r ,q, tau, dt, ite);
COP2;
C1 = permute(C2,[3,2,1]);
%C1
%C2e
%C2
%C2(:,:,1)
%C2(:,:,2)
%C2(:,:,3)

%[K,C1,mu] = CallOptionVG5D(C, G, M, S1, K1, r ,q, tau1,  n, m,k);
%C1(:,:,1)
%C1(:,:,2)
%C1(:,:,3)
C5 = BlackScholesSolution(K, S1, r, q, t, sig);
C1
C5
% Plot of the Call Option Values:
figure;
hold on
grid on
plot(S1, C1, 'r',S1, C5,'g',S1,COP2,'b');
xlabel 'Strike Price (USD)';
ylabel 'Value (USD)';
title 'European Call Option Price for the S&P500 under Black Scholes';
hold off