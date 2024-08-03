% General Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;
%S0 = 1124.47;
S0 = 2000;
r = 0.019;
q = 0.012;

% Parameters for the Variance Gamma Formula:
n=10;
m=10;
k=10;

% Time to Maturity:
tau1= [(30 - 18)/365, (7-6)/12+ (30 - 18)/365, (7-3)/12+ (30 - 18)/365, (7)/12+ (30 - 18)/365, (7+3)/12+ (30 - 18)/365, (7+6)/12+ (30 - 18)/365, (7+12)/12+ (30 - 18)/365];

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
% Formula for multiple Strike Prices and one Time to Maturities:
[M2,Abs,Res,mu] =  ConvergenceVG4D(C, G, M, S0, K1, r ,q, tau1,  n, m,k);

%for b = 1:k+1
%    Res(:,:,b)
%end

for b = 1:k+1
    Abs(:,:,b)
    sum(Abs(:,:,b),'all')
end

M2(:,:,n,m,k)
%[K,Abs,Res,mu] = ConvergenceVG(C, G, M, S, K, r ,q, tau,  n, m,k)



%[K1,CCOP1,mu] = CallOptionVG5D(C, G, M, S0, K1, r ,q, tau1, n-1, m-1,k-1);
%[K1,CCOP2,mu] = CallOptionVG5D(C, G, M, S0, K1, r ,q, tau1, n-1, m,k);
%[K1,CCOP3,mu] = CallOptionVG5D(C, G, M, S0, K1, r ,q, tau1, n, m-1,k);
%[K1,CCOP4,mu] = CallOptionVG5D(C, G, M, S0, K1, r ,q, tau1, n, m,k-1);
%[K1,CCOP5,mu] = CallOptionVG5D(C, G, M, S0, K1, r ,q, tau1, n, m,k-1);

%CCOP6 = (CCOP4-CCOP3-CCOP3-CCOP3+2*CCOP1);
%sqrt(sum(CCOP3.^2,'all'))
%sum(abs(CCOP3),'all')
%n2=0;
%m2 =0;
%k2 =0;
%[K1,CCOP2,mu] = CallOptionVG5D(C, G, M, S0, K1, r ,q, tau1, n2, m2,k2);
%CCOP2

%mean((CCOP1 - CCOP2).^2,'all')



%[K1,CCOP,mu] = CallOptionVG5D(C, G, M, S0, K1, r ,q, tau1,  n, m,k);
%CCOP

% Call Option values computation:
%[K,COP] = CallOptionVGSV2(C, G, M, k, eta, lambda, y0, S0, K, r ,q, t, dt, ite);
             
            
% Root Mean Square Error:
%err1 = RMSERevege(Data,CCOP);
%err1
%% ONE AT A TIME

% General Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;
%S0 = 1124.47;
%S0 = 2000;
S0 = 3000;
r = 0.019;
q = 0.012;

% Parameters for the Variance Gamma Formula:
n=10;
m=10;
k=10;

% Time to Maturity:
tau1= [(30 - 18)/365, (7-6)/12+ (30 - 18)/365, (7-3)/12+ (30 - 18)/365, (7)/12+ (30 - 18)/365, (7+3)/12+ (30 - 18)/365, (7+6)/12+ (30 - 18)/365, (7+12)/12+ (30 - 18)/365];

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
% Formula for multiple Strike Prices and one Time to Maturities:
[K,Abs,Res,mu] =  ConvergenceVG(C, G, M, S0, K1, r ,q, tau1,  n, m,k);
Abs
Res
%[K,Abs,Res,mu] = ConvergenceVG(C, G, M, S, K, r ,q, tau,  n, m,k)


