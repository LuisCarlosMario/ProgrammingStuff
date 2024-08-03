%%

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
axd =10;
n=40;
m=30;
k=30;
% Time to Maturity:
tau1= [(30 - 18)/365, (7-6)/12+ (30 - 18)/365, (7-3)/12+ (30 - 18)/365, (7)/12+ (30 - 18)/365, (7+3)/12+ (30 - 18)/365, (7+6)/12+ (30 - 18)/365, (7+12)/12+ (30 - 18)/365];
%tau1 = (7)/12+ (30 - 18)/365;
% Strike Prices:
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

%n = 55;
S00 = 500;
tau = 7/12 + (30 - 18)/365;
p= 10000

% Strike Prices:
K = 1025;
[TEC, TAC, TT, ThetaT] = ThetaConvergence(C, G, M, S00, K, r ,q, tau,  n, p);
%[CEC, CAC, CC, COPT] = ThetaConvergenceo(C, G, M, S0, K1, r ,q, tau1, n);

%Euc
%Abs
TEC
%CAC
%TT(:,:,11,1)
