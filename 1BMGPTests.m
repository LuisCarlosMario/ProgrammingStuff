%% BROWNIAN MOTION TEST%%

b = 1;
sig = 2;
t = 10;
dt = 0.0001; 

[T,X] = BrownianMotionDrift2(b, sig, t, dt);

figure;
hold on
plot(T,X, 'b');
xlabel 'Time';
ylabel 'Wiener Process';
title 'Brownian Motion';
hold off


%% GAMMA PROCESS TEST %%

a = 10;
b = 20;
t = 1;
dt = 0.0001;

[T,G] = GammaProcess5(a, b, t, dt);


figure;
hold on
plot(T,G, 'b');
xlabel 'Time';
ylabel 'Poisson Process';
title 'Possion Process';
hold off

% Monte Carlo Simulation for mean

n = 1000;
v = zeros([1,n]);

for i = 1:n
    [Tmc,Gmc] = GammaProcess5(a, b, t, dt);
    v(i) = Gmc(end);
end

mean(v)

%% GAMMA PROCESS STOCHASTIC VOLATILITY TEST %%

a = 10;
b = 20;
T = 0:0.0001:1;
G = GammaProcessSV(a, b, T);



figure;
hold on
plot(T, G, 'b');
xlabel 'Time';
ylabel 'Poisson Process';
title 'Possion Process';
hold off


