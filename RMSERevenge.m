%% PART 2 - ROOT MEAN SQUARED ERROR %%

%% BLACK-SCHOLES FORMULA %%

% Values:
S0 = 1124.47;
r = 0.019;
q = 0.012;
sig = 0.1812;

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

% Call Option Values computation:
C = BlackScholesSolution(K1, S0, r, q, tau1, sig);
C
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
             0      0      0      0      0      0  12.20]
             
            
% Root Mean Square Error:
err = RMSERevege(Data,C);
err


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
tau1= [(30 - 18)/365, (7-6)/12+ (30 - 18)/365, (7-3)/12+ (30 - 18)/365, (7)/12+ (30 - 18)/365, (7+3)/12+ (30 - 18)/365, (7+6)/12+ (30 - 18)/365, (7+12)/12+ (30 - 18)/365];

% Strike Prices:
K = 1110;
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
K2=[975; 995; 1025; 1050];


% Values for the formula for the Call Option under the Variace Gamma Model:
% Formula for one Strike Price and Time to Maturity:

% Values for the Monte Carlo Simulation
[SS0,MM,K,TM,COP,s] = CallOptionVGRevenge(C, G, M, S0, K1, r ,q, tau1, dt, ite);
COP

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
             0      0      0      0      0      0  12.20]
             
            
% Root Mean Square Error:
err = RMSERevege(Data,COP);
err


%% CALL OPTION VALUES FOR VARIANCE GAMMA WITH STOCHASTIC VOLATILITY %%

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
axd = 55;
n=axd;
m=axd;
k=axd;
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
K1 = 4000;
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
             
            
% Root Mean Square Error:
%err1 = RMSERevege(Data,CCOP1);
%err1;
5.9803;
[K,Abs,Res,M1,mu,lo] = ConvergenceVG44D(C, G, M, S0, K1, r ,q, tau1,  n, m,k);

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
N11
N1

%N2
%N3
%vpa(sqrt(sum(N1.^2,'all')),8)
%vpa(sqrt(sum(N2.^2,'all')),8)
%vpa(sqrt(sum(N3.^2,'all')),8)



%% EXAMPLE

C3  = [150.41 154.06 162.91 174.57 186.37 191.68 208.44;
        130.74 134.98 145.46 158.15 170.70 176.82 194.58;
        101.37 106.98 120.10 134.41 148.10 155.47 174.68;            
         77.09  83.73  99.80 116.69 130.15 138.58 158.87;
         53.06  61.32  80.49  97.68 113.14 122.53 143.79;
         38.81  48.29  69.47  87.50 103.41 113.33 135.12;
         29.40  39.83  62.40  80.96  97.15 107.40 129.52;
         20.11  31.61  55.58  74.61  91.05 101.62 124.05;
         11.02  23.72  49.04  68.50  85.16  94.13 118.72;
          6.59  19.93  45.87  65.53  82.29  95.99 116.10;
          3.08  16.26  42.79  62.63  79.47  90.55 113.51;
          2.56  12.79  39.78  59.78  76.69  87.89 110.95;
          2.21   9.67  36.86  57.00  73.96  85.27 108.43;
          1.72   7.20  31.31  51.66  68.66  80.16 103.50;
          1.40   5.76  26.23  46.60  63.58  75.23  98.71;
          1.16   4.69  21.75  41.82  58.73  70.49  94.06;
          1.06   4.26  19.79  39.54  56.40  68.20  91.79;
          0.73   2.77  13.18  29.41  45.65  57.45  80.97;
          0.52   1.88   9.15  21.72  36.46  47.89  71.02;
          0.38   1.30   6.45  16.21  28.83  39.50  61.94;
          0.29   0.93   4.60  12.15  22.83  32.32  53.74;
          0.21   0.66   3.32   9.19  18.13  26.36  46.37;
          0.15   0.47   2.45   6.96  14.47  21.43  39.87;
          0.11   0.35   1.86   5.26  11.60  17.42  34.18;
          0.07   0.20   1.13   3.03   7.52  11.49  24.95;
          0.05   0.15   0.73   1.77   4.93   7.61  18.09;
          0.04   0.12   0.50   1.06   3.21   5.14  13.20]
         
         
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
             0      0      0      0      0      0  12.20]
             
            
% Root Mean Square Error:
err3 = RMSERevege(Data,C3);
err3