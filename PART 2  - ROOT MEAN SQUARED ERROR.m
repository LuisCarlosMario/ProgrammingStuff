%% PART 2 - ROOT MEAN SQUARED ERROR %%

%% BLACK-SCHOLES FORMULA %%

% Values:
S0 = 1124.47;
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;
dt = 0.0001;
K = [975 995 1025 1050 1075 1100 1125 1140 1150 1175 1200 1225 1250 1275];
sig = 0.1812;

% Call Option Values computation:
C = BlackScholesSolution(K, S0, r, q, t, sig);

% Actual Values of the Call Option:
Data = [173.30 157.00 133.10 114.80 97.60 81.20 66.90 58.90 53.90 42.50 33.00 24.90 18.30 13.20];

% Root Mean Square Error:
RMSE(C,Data)


%% CALL OPTION VALUES FOR VARIANCE GAMMA %%

% Values:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;
dt=0.0001;
K = [975 995 1025 1050 1075 1100 1125 1140 1150 1175 1200 1225 1250 1275];
ite = 10000;

% Call Option values computation:
[K,COP] = CallOptionVG2(C, G, M, S0, K, r ,q, t, dt, ite);

% Actual Values of the Call Option:
Data = [173.30 157.00 133.10 114.80 97.60 81.20 66.90 58.90 53.90 42.50 33.00 24.90 18.30 13.20];

% Root Mean Square Error:
RMSE(COP,Data)


%% CALL OPTION VALUES FOR VARIANCE GAMMA WITH STOCHASTIC VOLATILITY %%

% Values:
C = 11.9896;
G = 25.8523;
M = 35.5344;
k = 0.6020;
eta = 1.5560;
lambda = 1.9992;
y0 = 1;
S0 = 1124.47;
r = 0.019;
q = 0.012;
t= 7/12+ (30 - 18)/365;
dt=0.0001;
K = [975 995 1025 1050 1075 1100 1125 1140 1150 1175 1200 1225 1250 1275];
ite = 10000;

% Call Option values computation:
[K,COP] = CallOptionVGSV2(C, G, M, k, eta, lambda, y0, S0, K, r ,q, t, dt, ite);

% Actual Values of the Call Option:
Data = [173.30 157.00 133.10 114.80 97.60 81.20 66.90 58.90 53.90 42.50 33.00 24.90 18.30 13.20];

% Root Mean Square Error:
RMSE(COP,Data)
