%%  VARIANCE GAMMA FORMULA  %%


% Variance Gamma Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;

% General Parameters 
S0 = 1124.47;
r = 0.019;
q = 0.012;

% Times to Maturity:
tau=35*7/365;

% Strike Prices:
K = 1025;

% Parameters for the Variance Gamma formula:
n=22;
m=27;
k=7;
n=30;
m=30;
k=12;
p=10000;

% Call Option prices for the Variace Gamma formula computation:
Mvect = 14:0.002:15;
len = length(Mvect);
vect = 1:len;
COPv=zeros(1,len);

for j = vect
    COP  = VarianceGammaSumFormula(C, G, Mvect(j), S0, K, r ,q, tau, n, m, k);
    COPv(j) = COP;
end

% Plot of the Call Option Price:
figure;
hold on
grid off
plot(Mvect, COPv,'b');
xlabel 'Asset Price (USD)';
ylabel 'Option Price (USD)';
title 'European Call Option Price Estimate for the S&P500';
legend({'Variance Gamma Formula','Brownian Motion'}, 'Location', 'NorthWest');
hold off


Mvect = 14:0.002:15;
len = length(Mvect);
vect = 1:len;
COPv=zeros(1,len);

for j = vect
    COP  = MVarianceGammaDerivative(C, G, Mvect(j), S0, K, r ,q, tau, n, m, k);
    Mvect(j)
    COPv(j) = COP;
end

% Plot of the Call Option Price:
figure;
hold on
grid off
plot(Mvect, COPv,'b');
xlabel 'Asset Price (USD)';
ylabel 'Option Price (USD)';
title 'European Call Option Price Estimate for the S&P500';
legend({'Variance Gamma Formula','Brownian Motion'}, 'Location', 'NorthWest');
hold off