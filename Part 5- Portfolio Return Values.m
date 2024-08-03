%% PORTFOLIO RETURN VALUES FOR VARIANCE GAMMA %%

% Values:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;
dt=0.0001;
%Kmin = 975;
K = S0;
%Kmax = 1275;
ite = 10000;
p = 0.02;

% Return computation:
[R,RwC] = PortfolioReturnVG2(C, G, M, S0, K, r ,q, t, dt, ite, p);
R
RwC

% Plot of the Call Option Values:
%figure;
%hold on
%grid on
%plot(K, COP, 'b');
%xlabel 'Strike Price (USD)';
%ylabel 'Value (USD)';
%title 'European Call Option Price for the S&P500 under Variance Gamma';
%hold off
