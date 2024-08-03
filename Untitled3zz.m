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
ite=1000;
SS=zeros(ite,2);

for i=1:ite
    [X,TM,S,s,m] = StockPriceVGRevenge(C, G, M, S0, r ,q, T, dt);
    %size(S)
    %s
    SS(i,1) = S(floor(s(1)),1);
    SS(i,2) = S(floor(s(2)),2);
end
%SS
X
%S
%m
%S(end,:)
%s
%T1 = TM(1:floor(s(2)),2);
%S1 = S(1:floor(s(2)),2);
%T
mean(SS)
%exp(-r*T).*mean(SS)

%Plot:
figure;
hold on
grid on
plot(T1,S1,'b');
xlabel 'time (USD)';
ylabel 'stock price (USD)';
title 'Simulation of the value of the S&P500 using Variance Gamma';
hold off

%% STOCK PRICE SIMULATION UNDER VARIANCE GAMMA %%

% Values
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;
dt=0.0001;

%Simulation:
[T,S] = StockPriceVG(C, G, M, S0, r ,q, t, dt);

ite=1000;
Z=zeros(1,ite);

for i=1:ite
    [T,S] = StockPriceVG(C, G, M, S0, r ,q, t, dt);
    Z(i) = S(end);
end

mean(Z)

%Plot:
figure;
hold on
grid on
plot(T,S,'b');
xlabel 'time (USD)';
ylabel 'stock price (USD)';
title 'Simulation of the value of the S&P500 using Variance Gamma';
hold off