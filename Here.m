% General Parameters:
C = 1.3574;
G = 5.8704;
M = 14.2699;
S0 = 1124.47;
sig = 0.1812;
%S1 = 1000:10:1600;
%S1 = [1000 1100 1200 1300 1400 1500 1600];
%S1 = 1000:25:1200;
r = 0.019;
q = 0.012;

% Parameters for the Monte Carlo Simulation:
dt=0.0001;
ite = 10000;

% Parameters for the Variance Gamma Formula:
n=55;
m=55;
k=55;
ite = 100;

% Time to Maturity:
tau= (7-4)/12+ (30 - 18)/365;
t = 7/12 + (30 - 18)/365;

% Strike Prices:
K = 1110;
%S1=1000;
%S2=2000;
%S3=3000;
%S4=4000;
S = 1000:100:4000;
l = length(S);
CC = zeros(1,l);

% Values for the formula for the Call Option under the Variace Gamma Model:
% Formula for one Strike Price and Time to Maturity:
%[NN,K,TM,COP2,s] = CallOptionVGRevengeStock(C, G, M, S1, K, r ,q, tau, dt, ite);
%[K,COP,mu] = CallOptionVG5D(C, G, M, S1, K, r ,q, tau,  n, m,k);
%COP;
%C1 = permute(COP,[3,2,1]);
%C1;


%S = 1600;
%[COP1,C1,C2,C3,mu] = CallOptionVG5D(C, G, M, S1, K, r ,q, t,  n, m,k);
%COP1
%[COP2,C1,C2,C3,mu] = CallOptionVG5D(C, G, M, S2, K, r ,q, t,  n, m,k);
%COP2
%[COP3,C1,C2,C3,mu] = CallOptionVG5D(C, G, M, S3, K, r ,q, t,  n, m,k);
%COP3
%[COP4,C1,C2,C3,mu] = CallOptionVG5D(C, G, M, S4, K, r ,q, t,  n, m,k);
%COP4
%[COP,C1,C2,C3,mu] = CallOptionVG5D(C, G, M, S, K, r ,q, t,  n, m,k);
%C = [COP1, COP2, COP3,COP4];
%C1
%C2
%C3
for s = 1:l
    [COP,C1,C2,C3,mu] = CallOptionVG5D(C, G, M, S(s), K, r ,q, t,  n, m,k);
    CC(s) = COP;
end

%Plot:
figure;
hold on
grid on
plot(S,CC,'b','LineWidth',0.1);
xlabel 'time';
ylabel 'variance gamma values';
title 'One path simulation for a Variance Gamma Process';
hold off