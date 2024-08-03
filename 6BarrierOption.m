%% BARRIER OPTION PRICES %%

C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
Kmax = 1124.47;
dK = 1;
Kmin = 1124.47;
r = 0.019;
q = 0.012;
t= 1;
dt=0.0001;
H = 1.1*S0;
ite = 10000;

BOP = BarrierOptionPrice(C, G, M, S0, Kmin, dK, Kmax, H, r ,q, t, dt, ite);
BOP
