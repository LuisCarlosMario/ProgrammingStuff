%% GREEKS

%% DELTA VARIANCE GAMMA


% General Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
sig = 0.1812;

% Parameters for the Variance Gamma Formula:
axd = 30;
n=axd;
m=axd;
k=axd;

% Time to Maturity:
tau= 7/12+ (30 - 18)/365;

% Strike Prices:
S = 500:5:2000;
K = 1025;
len = length(S);

% Values for the formula for the Call Option under the Variace Gamma Model:
% Formula for one Strike Price and Time to Maturity:
DD = zeros(len,1);
[K,D,mu] = DeltaVG4D(C, G, M, S0, K, r ,q, tau,  n, m,k);
D;
[CallBS, PutBS, DeltaBS, GammaBS, RhoBS, ThetaBS] = BlackScholes(S, K, r, q, tau, sig);
DeltaBS;
for i = 1:len
    [K,D,mu] = DeltaVG4D(C, G, M, S(i), K, r ,q, tau,  n, m,k);
     DD(i) = D;
end
%[COP,C1,C2,C3,mu] =  CallOptionVG4D(C, G, M, S, K, r ,q, tau,  n, m,k);
%V=permute(CCP,[3,2,1]);
%V
size(S)
size(DeltaBS)
size(DD)
%Plot:
figure;
hold on
grid off
plot(S,DeltaBS,'r',S,DD,'b','LineWidth',0.1);
xlabel 'Stock Price';
ylabel 'Variance gamma values';
title 'Delta';
legend({'Brownian Motion','Variance Gamma Formula'}, 'Location', 'NorthWest');
hold off

%% GAMMA VARIANCE GAMMA


% General Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
sig = 0.1812;



% Parameters for the Variance Gamma Formula:
axd = 30;
n=axd;
m=axd;
k=axd;

% Time to Maturity:
tau= 7/12+ (30 - 18)/365;

% Strike Prices:
S = 500:5:2000;
K = 1025;
len = length(S);

% Values for the formula for the Call Option under the Variace Gamma Model:
% Formula for one Strike Price and Time to Maturity:
GG1 = zeros(len,1);
GG2 = zeros(len,1);
[K,Gamma,mu] = GammaVG4D(C, G, M, S0, K, r ,q, tau,  n, m,k);
Gamma
[DeltaBS, GammaBS, RhoBS, ThetaBS] = BlackScholesGreeks(K, S, r, q, tau, sig);
for i = 1:len
    [K,Gamma1,mu] = GammaVG4D(C, G, M, S(i), K, r ,q, tau,  n, m,k);
    %[K,Gamma2,mu] = RRGammaVG4D(C, G, M, S(i), K, r ,q, tau,  n, m,k);    
    GG1(i) = Gamma1;
    %GG2(i) = Gamma2;
end
%[COP,C1,C2,C3,mu] =  CallOptionVG4D(C, G, M, S, K, r ,q, tau,  n, m,k);
%V=permute(CCP,[3,2,1]);
%V
%S
%GG
%Plot:
figure;
hold on
grid off
plot(S,GammaBS,'r',S,GG1,'b','LineWidth',0.1);
xlabel 'Stock Price (USD)';
ylabel 'Gamma values';
title 'Gamma';
legend({'Brownian Motion','Variance Gamma Formula'}, 'Location', 'NorthWest');
hold off


%% PHO VARIANCE GAMMA

% General Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
sig = 0.1812;

% Parameters for the Variance Gamma Formula:
axd = 30;
n=axd;
m=axd;
k=axd;

% Time to Maturity:
tau= 7/12+ (30 - 18)/365;

% Strike Prices:
S = 500:5:2000;
K = 1025;
len = length(S);

% Values for the formula for the Call Option under the Variace Gamma Model:
% Formula for one Strike Price and Time to Maturity:
RR = zeros(len,1);
[K,Rho,mu] = RhoVG4D(C, G, M, S0, K, r ,q, tau,  n, m,k);
Rho;
[DeltaBS, GammaBS, RhoBS, ThetaBS] = BlackScholesGreeks(K, S, r, q, tau, sig);
for i = 1:len
    [K,Rho,mu] = RhoVG4D(C, G, M, S(i), K, r ,q, tau,  n, m,k);
     RR(i) = Rho;
end
%[COP,C1,C2,C3,mu] =  CallOptionVG4D(C, G, M, S, K, r ,q, tau,  n, m,k);
%V=permute(CCP,[3,2,1]);
%V
S
RR
%Plot:
figure;
hold on
grid off
plot(S,RhoBS,'r',S,RR,'b','LineWidth',0.1);
xlabel 'Stock Price (USD)';
ylabel 'Rho values';
title 'Rho';
legend({'Brownian Motion','Variance Gamma Formula'},'Location', 'NorthWest');
hold off

%% THETA VARIANCE GAMMA

% General Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
sig = 0.1812;

% Parameters for the Variance Gamma Formula:
axd = 30;
n=34;
m=19;
k=7;
p=10000;

% Time to Maturity:
tau= 7/12+ (30 - 18)/365;

% Strike Prices:
%S = 500:20:2000;
S = 500:5:1500;
K = 1025;
len = length(S);

% Values for the formula for the Call Option under the Variace Gamma Model:
% Formula for one Strike Price and Time to Maturity:
TT = zeros(len,1);
%[K,Theta,mu] = ThetaVG4D(C, G, M, S0, K, r ,q, tau,  n, m,k);
%Theta
[DeltaBS, GammaBS, RhoBS, ThetaBS] = BlackScholesGreeks(K, S, r, q, tau, sig);
for i = 1:len
    %[K,Theta,mu] = ThetaVG4D(C, G, M, S(i), K, r ,q, tau,  n, m,k,p);
    Theta = ThetaVGSumFormula(C, G, M, S(i), K, r ,q, tau,  n, m, k, p);
    %Theta
    %Theta1
     TT(i) = Theta;
end
%[COP,C1,C2,C3,mu] =  CallOptionVG4D(C, G, M, S, K, r ,q, tau,  n, m,k);
%V=permute(CCP,[3,2,1]);
%V
S
TT
ThetaBS
%Plot:
figure;
hold on
grid off
%plot(S,ThetaBS,'r','LineWidth',0.1);
plot(S,ThetaBS,'r',S,TT,'b','LineWidth',0.1);
xlabel 'Stock Price (USD)';
ylabel 'Theta Values';
title 'Theta';
legend({'Brownian Motion','Variance Gamma Formula'}, 'Location', 'NorthEast');
hold off