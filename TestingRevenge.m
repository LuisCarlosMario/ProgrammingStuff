%% GAMMA PROCESS TEST %%

a = 10;
b = 20;
T = [1 2 3];
dt = 0.02;

[TM,G,s] = GammaProcessRevenge(a, b, T, dt);
%T1 = T(:,2);
%G1 = G(:,2);
%s
%T1
%G1
G
TM
T11 = TM(1:s(2),2);
G11 = G(1:s(2),2);
figure;
hold on
plot(T11,G11,'b');
xlabel 'Time';
ylabel 'Poisson Process';
title 'Possion Process';
hold off

% Monte Carlo Simulation for mean

n = 1000;
v = zeros([1,n]);

for i = 1:n
    [Tmc,Gmc] = GammaProcess5(a, b, t, dt);
    v(i) = Gmc(end);
end

mean(v)


%% VARIANCE GAMMA SIMULATION %%

% The values used bellow where suggested in Chapter 8.4 of Schoutens book 
% "Lévy process in Finance" and an identical simulation can be seen in
% Figure 8.4 in the aformentioned Chapter:
C = 20;
G = 40;
M = 50;
T = [4/12+ (30 - 18)/365, 7/12+ (30 - 18)/365];
dt = 0.0001;

% Simulation:
[T,X,s] = VarianceGammaRevenge(C, G, M, T, dt);
T
s
T3=T(1:s(1),1);
X3=X(1:s(1),1);

%Plot:
figure;
hold on
grid on
plot(T3,X3,'b','LineWidth',0.1);
xlabel 'time';
ylabel 'variance gamma values';
title 'One path simulation for a Variance Gamma Process';
hold off

%% STOCK PRICE SIMULATION UNDER VARIANCE GAMMA %%

% Values
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
T = [4/12+ (30 - 18)/365, 7/12+ (30 - 18)/365];
%T= [1 2 3];
% dt=0.0001
dt = 0.0001;


%Simulation:
[X,TM,S,s,m] = StockPriceVGRevenge(C, G, M, S0, r ,q, T, dt);
TM
%S

S
%s
m
T1 = TM(1:floor(s(2)),2);
S1 = S(1:floor(s(2)),2);
S0*exp((r-q)*TM+ X)


%Plot:
figure;
hold on
grid on
plot(T1,S1,'b');
xlabel 'time (USD)';
ylabel 'stock price (USD)';
title 'Simulation of the value of the S&P500 using Variance Gamma';
hold off

%% CALL OPTION VALUES FOR VARIANCE GAMMA %%

% Values:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
T= [4/12+ (30 - 18)/365, 7/12+ (30 - 18)/365];
dt=0.0001;
K = [975;
    995;
    1025;
    1050;
    1075];
%K = 1050;
ite = 10000;

% Call Option computation:
[SS0,MM,K,TM,COP,s] = CallOptionVGRevenge(C, G, M, S0, K, r ,q, T, dt, ite);
%mean(MM,3)
COP
%SS0
% Plot of the Call Option Values:
figure;
hold on
grid on
plot(K, COP, 'b');
xlabel 'Strike Price (USD)';
ylabel 'Value (USD)';
title 'European Call Option Price for the S&P500 under Variance Gamma';
hold off

% Extra values
sig0 = 0.5;
tol = 0.000001;
maxIterations = 100;

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
