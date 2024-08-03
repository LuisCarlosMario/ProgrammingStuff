%% VOLATILITY SMILE

%
n=22;
m=27;
k=7;

% Variance Gamma Parameters:
%C = 5;
C = 1.3;
dc =0.000001;
%G = 5;
G = 5;
dg =0.000001;
%M = 5;
M = 13;
dm =0.000001;

% General Parameters:
S0 = 1124.47;
r = 0.019;
q = 0.012;

% Times to Maturity:
tau=[4*7/365  9*7/365  22*7/365  35*7/365  48*7/365  61*7/365  87*7/365];

% Strike Prices:
K =[975;
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

% Actual Values of the Call Option:
Data = [     0      0 161.60 173.30      0      0      0;
             0      0 144.80 157.00      0 182.10      0;
             0      0 120.10 133.10 146.50      0      0;
             0  84.50 100.70 114.80      0 143.00 171.40;
             0  64.30  82.50  97.60      0      0      0;
         43.10      0      0      0      0      0      0;
         35.60      0  65.50  81.20  96.20 111.30 140.40;
             0  39.50      0      0      0      0      0;
         22.90  33.50      0      0      0      0      0;
         20.20  30.70  51.00  66.90  81.70  97.00      0;
             0  28.00      0      0      0      0      0;
             0  25.60  45.50      0      0      0      0;
         13.30  23.20      0  58.90      0      0      0;
             0  19.10  38.10  53.90  68.30  83.30 112.80;
             0  15.30      0      0      0      0      0;
             0  12.10      0      0      0      0      0;
             0  10.90  27.70  42.50  56.60      0  99.80;
             0      0  19.60  33.00  46.10  60.90      0;
             0      0  13.20  24.90  36.90  49.80      0;
             0      0      0  18.30  29.30  41.20  66.90;
             0      0      0  13.20  22.50      0      0;
             0      0      0      0  17.20  27.10  49.50;
             0      0      0      0  12.80      0      0;
             0      0      0      0      0  17.10  35.70;
             0      0      0      0      0  10.10  25.20;
             0      0      0      0      0      0  17.00;
             0      0      0      0      0      0  12.20];


% Parameters for the Newton method:
%C0 = 0.1;
%G0 = 0.1;
%M0 = 0.1;
C0 = 1;
G0 = 5;
M0 = 12;

tol = 0.00004;
%maxIterations = 100000;
maxIterations = 100;

% Minimum Volatilities:
%X = MinCGM(Data, S0, K, r ,q, tau, n, m, k, tol, maxIterations, C0, G0, M0, dc, dg, dm);
X = MinFPCGM(Data, S0, K, r ,q, tau, n, m, k, tol, maxIterations, C0, G0, M0, dc, dg, dm);
%sig = MinVolatility2 (Data, K, S0, r , q, tau, sig0, tol, maxIterations, sigInt);
X