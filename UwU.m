%% CALL OPTION VALUES FOR VARIANCE GAMMA %%

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
n=30;
m=30;
k=30;

% Time to Maturity:
tau1= [ (7-3)/12+ (30 - 18)/365, (7)/12+ (30 - 18)/365, (7+3)/12+ (30 - 18)/365];

% Strike Prices:
K = 1110;
K1 =[975;
    995;
    1025;
    1050;
    1075];
K2=[975; 995; 1025; 1050];


% Values for the formula for the Call Option under the Variace Gamma Model:
% Formula for one Strike Price and Time to Maturity:

% Values for the Monte Carlo Simulation
COP = CallOptionVGRevenge(C, G, M, S0, K1, r ,q, tau1, dt, ite);
COP