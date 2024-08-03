%% BROWNIAN MOTION TEST%%


C = 20;
G = 40;
M = 50;
t=1;
dt=0.001;

[T,X] = VarianceGamma3(C, G, M, t, dt);

figure;
hold on
plot(T,X, 'r');
xlabel 'Time';
ylabel 'Variance Gamma';
title 'Variance Gamma';
hold off


% Monte Carlo Simulation for mean

n = 10000;
v = zeros([1,n]);

for i = 1:n
    [Tmc,Xmc] = VarianceGamma3(C, G, M, t, dt);
    v(i) = Xmc(end);
end

mean(v)
var(v)
