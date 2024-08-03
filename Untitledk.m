
% Variance Gamma Parameters:
C = 1:0.02:5;
G = 2;
M = 12;
dc=0.0000001;
dg=0.0000001;
dm=0.0000001;

% General Parameters:
S0 = 1124.47;
r = 0.019;
q = 0.012;

% Times to Maturity:
tau=35*7/365;

% Strike Prices:
K =1125;

n = 22;
m = 28;
k = 7;

CVGF = zeros(1,length(C));
PVGF = zeros(1,length(C));
for m1 = 1:length(C)
    m1
    [COP,CDer,GDer,MDer, CCDer, GGDer, MMDer, CGDer, CMDer, GMDer] = VarianceGammaDerivatives(C(m1), G, M, dc, dg, dm, S0, K, r ,q, tau, n, m, k);
    CVGF(m1) = CDer;
    PVGF(m1) = CCDer;
end

figure;
hold on
grid off
plot(C, CVGF,'b',C, PVGF,'r--');
xlabel 'Asset Price (USD)';
ylabel 'Option Price (USD)';
title 'European Call Option Price Estimate for the S&P500';
legend({'Variance Gamma Formula','Brownian Motion'}, 'Location', 'NorthWest');
hold off