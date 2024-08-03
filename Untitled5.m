%[T,X] = VGSV2(C, G, M, k, eta, lambda, y0, t, dt)
C = 11.9896;
G = 25.8583;
M = 35.5344;
k = 0.6020;
eta = 1.5560;
lambda = 1.9992;
y0 = 1;



dt=0.001;
t=100;


[T,X] = VGSV2(C, G, M, k, eta, lambda, y0, t, dt);

figure;
hold on
plot(T, X, 'r');
xlabel 'Time';
ylabel 'Poisson Process';
title 'Poisson Motion';
hold off

%[T,X] = VGSV2(C, G, M, k, eta, lambda, y0, t, dt)
C = 15.94;
M = 17.71;
G = 51.33;
k = 0.6662;
eta = 19.63;
lambda = 0.0024;
y0 = 1;

dt=0.001;
t=2;


[T,S] = VGSV2(C, G, M, k, eta, lambda, y0, t, dt);

figure;
hold on
plot(T, S, 'b');
xlabel 'Time';
ylabel 'Poisson Process';
title 'Poisson Motion';
hold off



