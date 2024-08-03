%% Convergence of Variance Gamma Formula

% General Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
r = 0.019;
q = 0.012;

% Parameters for the Variance Gamma Formula:
n=5;
m=5;
k=5;

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
CONV = zeroes(n,m,k);
for i = 1:n
    for j = 1:m
        for h = 1:k
            [K1,CC1,mu] = CallOptionVG5D(C, G, M, S0, K1, r ,q, tau1,  n-1, m-1,k);
            
        end
    end
end
% Root Mean Square Error:
err1 = RMSERevege(Data,CCOP);
err1