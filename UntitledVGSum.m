C = 1.3574;
G = 5.8704;
M = 14.2699;
%C = 1;
%G = 2;
%M = 3;
S0 = 1124.47;
r = 0.019;
q = 0.012;

%tau = 2;
tau= 7/12+ (30 - 18)/365;
dt=0.0001;
K = 1750;
ite = 10000;

n=10;
m=10;
k=10;

cp = 0.0244;
alphap = 1.2945;
lambdam = 0.0765;
lambdap = 7.5515;

T=tau;
Nx=100;
Nt=100;
Cp=cp;
Cm=cp;
Lp=lambdap;
Lm=lambdam;
Ap=alphap;
Am=alphap;

%cp = C;
%alphap = 0.01;
%lambdam = G;
%lambdap = M;

me=log(VGCharacteristicFunction(-i, C, G, M));
me
%mi=log(CGMYCharacteristicFunction(-i, cp, lambdam, lambdap, alphap));
%mi
K >= S0*exp((r-q)*tau - me*tau)
%K >= S0*exp((r-q)*tau - mi*tau)
[K1,C1] = CallOptionVG2(C, G, M, S0, K, r ,q, tau, dt, ite);
%[K2,C2,mu] = CallOptionVGSum(C, G, M, S0, K, r ,q, tau,  n, m);
%[K3,C3,mu3] = CallOptionVGSum2(C, G, M, S0, K, r ,q, tau,  n, m);
22.552;
C1
%C2
%C3
%[K,COP,muh] = CallOptionGTS1Sum(cp, alphap, lambdap, lambdam, S0, K, r, q, tau,  n, m);
%COP

%[K,CA,mu] = CallOptionVGSumA(C, G, M, S0, K, r ,q, tau,  n, m);
%CA
[K,CC,mu] = CallOptionVG3D(C, G, M, S0, K, r ,q, tau,  n, m,k);
CC
%muh
%[Price] = GTSPFPDE(S0,K,r,q,T,Nx,Nt,Cp,Cm,Lp,Lm,Ap,Am);
%Price
%mu
%[K3,C3,mu3] = CallOptionVGSum2(C, G, M, S0, K, r ,q, tau,  n, m);
%C3
% K>=S*exp(r*tau)/(VGCharacteristicFunction(-i, C, G, M)^tau);
% [K1,C1] = CallOptionVG2(C, G, M, S0, K, r ,q, tau, dt, ite)
% [K2,C2,mu] = CallOptionVGSum(C, G, M, S, K, r ,q, tau,  n, m)