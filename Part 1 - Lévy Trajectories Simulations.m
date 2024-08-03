%% PART 1 - LÉVY-TRAJECTORIES SIMULATIONS %%

%% BROWNIAN MOTION WITH DRIFT SIMULATION %%

% Values used:
b = 1;
sig = 2;
t = 1;
dt = 0.0001;

% Simulation:
[T,X] = BrownianMotionDrift(b, sig, t, dt);

% Plot:
figure;
hold on
grid on
plot(T,X,'b');
xlabel 'time';
ylabel 'brownian motion values';
title 'Sample Path from a Brownian Motion with Drift';
hold off


%% GAMMA PROCESS SIMULATION %%

% The values used bellow where suggested in Chapter 8.4 of Schoutens book 
% "Lévy process in Finance" and an identical simulation can be seen in
% Figure 8.4 in the aformentioned Chapter:
a = 10;
b = 20;
t = 1;
dt = 0.0001;

% Simulation:
[T,G] = GammaProcess(a, b, t, dt);

% Plot:
figure;
hold on
grid on
plot(T,G, 'g');
xlabel 'time';
ylabel 'gamma process values';
title 'Sample Path from a Gamma Process';
hold off


%% VARIANCE GAMMA SIMULATION %%

% The values used bellow where suggested in Chapter 8.4 of Schoutens book 
% "Lévy process in Finance" and an identical simulation can be seen in
% Figure 8.4 in the aformentioned Chapter:
C = 20;
G = 40;
M = 50;
t = 1;
dt = 0.0001;

% Simulation:
[T,X] = VarianceGamma(C, G, M, t, dt);

%Plot:
figure;
hold on
grid on
plot(T,X,'b','LineWidth',0.1);
xlabel 'time';
ylabel 'variance gamma values';
title 'One path simulation for a Variance Gamma Process';
hold off


%% COX-INGERSOLL-ROSS PROCESS SIMULATION %%

% The values used bellow where suggested in Chapter 8.4 of Schoutens book 
% "Lévy process in Finance" and an identical simulation can be seen in
% Figure 8.10 in the aformentioned Chapter:
k = 5;
eta = 1;
lambda = 2;
y0 = 1.25;
t = 1;
dt = 0.0001;

% Simulation:
[T,y,Y] = CIRProcess(y0, k ,eta, lambda, t, dt);

% Plots:
figure;
hold on
grid on
plot(T,y,'r','LineWidth',0.1);
xlabel 'time';
ylabel 'time change';
title 'Sample Path for the time change of a CIR Process';
hold off

figure;
hold on
grid on
plot(T,Y,'r','LineWidth',0.1);
xlabel 'time';
ylabel 'clock time';
title 'Sample Path for the clock of a CIR Process';
hold off


%% VARIAMCE GAMMA WITH STOCHASTIC VOLATILITY TEST %%

% The values used bellow where suggested in Chapter 8.4 of Schoutens book 
% "Lévy process in Finance" and an identical simulation can be seen in
% Figure 8.10 in the aformentioned Chapter:
C = 20;
G = 40;
M = 50;
k = 5;
eta = 1;
lambda = 2;
y0 = 1.25;
t = 1;
dt = 0.0001;

% Simulation:
[T,X] = VarianceGammaSV(C, G, M, k, eta, lambda, y0, t, dt);

%Plots:
figure;
grid on;
hold on;
plot(T, X, 'g','LineWidth',0.1);
xlabel 'time';
ylabel 'VGSV values';
title 'One path simulation for the Variance Gamma with Stochastic Volatility';
hold off

