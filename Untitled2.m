

% Variance Gamma Parameters:
dx = 0.001;
C = 1.2:dx:1.4;
G = 5.8704;
M = 14.2699;

% General Parameters:
S0 = 1124.47;
K = 1025;
tau = 7/12 + (30 - 18)/365;
r = 0.019;
q = 0.012;

% Stochastic Volatility:
sig = 0.1812;

% Parameters for the Variance Gamma Formula:
n=38;
m=27;
k=8;
p=1000;

% Delta measure for the Variance Gamma formula computation:
len = length(C);
CC = zeros(len,1);
CD = zeros(len,1);
DD = zeros(len,1);
for j = 1:len
    C(j)
    COP = VarianceGammaSumFormula(C(j), G, M, S0, K, r ,q, tau,  n, m, k);
    CC(j) = COP;
    Der = CVarianceGammaDerivative(C(j), G, M, S0, K, r ,q, tau, n, m,k,p);
    CD(j) = Der;
end


for j = 1:(len-1)
    DD(j) = (CC(j+1)-CC(j))/dx;
end


DD(end) = DD(len-1);

% Plot of the Delta measure function
figure;
hold on
grid off
%plot(C,CC,'r',C,DD,'g');
plot(C,DD,'g',C,CD,'k');
xlabel 'Stock Price';
ylabel 'Variance gamma values';
title 'Delta';
legend({'Brownian Motion','Variance Gamma Formula'}, 'Location', 'NorthWest');
hold off