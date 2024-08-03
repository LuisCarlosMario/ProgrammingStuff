%% CALL PRICE VS STOKE PRICE

%% VARIANCE GAMMA FORMULA


% General Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;

% Parameters for the Variance Gamma Formula:
axd = 30;
n=axd;
m=axd;
k=axd;

% Time to Maturity:
tau= 7/12+ (30 - 18)/365;

% Strike Prices:
S = 1000:5:2000;
K = 1025;
l = length(S);

% Values for the formula for the Call Option under the Variace Gamma Model:
% Formula for one Strike Price and Time to Maturity:
CC = zeros(l,1);
[K,COP,mu] = CallOptionVG4D(C, G, M, S0, K, r ,q, tau,  n, m,k)
COP
for i = 1:l
    [K,COP,mu] = CallOptionVG4D(C, G, M, S(i), K, r ,q, tau,  n, m,k);
     CC(i) = COP;
end
%[COP,C1,C2,C3,mu] =  CallOptionVG4D(C, G, M, S, K, r ,q, tau,  n, m,k);
%V=permute(CCP,[3,2,1]);
%V
S
CC
%Plot:
figure;
hold on
grid on
plot(S,CC,'b','LineWidth',0.1);
xlabel 'Stock Price';
ylabel 'Variance gamma values';
title 'One path simulation for a Variance Gamma Process';
hold off


%% BLACK.SCHOLES
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
title 'European Call Option Price for the S&P500 under Black-Scholes';
hold off