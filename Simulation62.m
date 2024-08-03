%% 6.2. Convergence

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
n=30;
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

% Formula for multiple Strike Prices and one Time to Maturities:
%[K1,CCOP1,mu] = CallOptionVG4D(C, G, M, S0, K1, r ,q, tau1, n-1, m,k);
%CCOP1
%[K1,CCOP2,mu] = CallOptionVG4D(C, G, M, S0, K1, r ,q, tau1,n, m,k);
%CCOP2
%CCOP2-CCOP1

% Call Option values computation:
%[K,COP] = CallOptionVGSV2(C, G, M, k, eta, lambda, y0, S0, K, r ,q, t, dt, ite);

% Actual Values of the Call Option:
Data = [     0      0 161.60 173.30      0      0      0;
             0      0 144.80 157.00      0 182.10      0;
             0      0 120.10 114.80 146.50      0      0;            
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
             
%K1 = 1100;
%S0 = 2000;         
% Root Mean Square Error:
%err1 = RMSERevege(Data,CCOP1);
%err1;
%5.9803;
[EucN, EucM, EucK, AbsN, AbsM, AbsK,Abs,Res,M1,mu,lo]  = ConvergenceVG444D(C, G, M, S0, K1, r ,q, tau1,  n);

%for b = 1:k+1
%    Abs(:,:,b)
%    %sum(Abs(:,:,b),'all')
%end

%for b = 1:k+1
%    M1(:,:,b,27,3)
%    sum(abs(M1(:,:,b,1,7)),'all')
%    %sum(Abs(:,:,b),'all')
%end
k1 = length(K1);
t1 = length(tau1);
N11 = zeros(k1,t1);
N1 = zeros(k1,t1);
N2 = zeros(k1,t1);
N3 = zeros(k1,t1);
for i=1:t1
    for j=1:k1
        N11(j,i) = sum(M1(n+1,m+1,k+1,j,i),'all');
        N1(j,i)=sum(M1(n+1,:,:,j,i),'all');
        N2(j,i)=sum(M1(:,m+1,:,j,i),'all');
        N3(j,i)=sum(M1(:,:,k+1,j,i),'all');
    end
end

EucN
EucM
EucK
AbsN
AbsM
AbsK

%N1
%N2
%N3
%Nx
%Ny
%Nz
%Nxxx
%Mxxx
%Kxxx
%Nxxxa
%Mxxxa
%Kxxxa
%N2
%N3
%vpa(sqrt(sum(N1.^2,'all')),8)
%vpa(sqrt(sum(N2.^2,'all')),8)
%vpa(sqrt(sum(N3.^2,'all')),8)

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
n=30;
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
%S0 = 4000;
%tau1 = 7/12 + (30 - 18)/365;

% Strike Prices:
%K1 = 1110;

[CEC, CAC, CC, COPT] = ConvergenceofVG(C, G, M, S0, K1, r ,q, tau1, n);

%Euc
%Abs
CEC
CAC
CC(:,:,11,1)
