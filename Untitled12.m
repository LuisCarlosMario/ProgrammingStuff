%[T,y,Y] = CIRProcess2(y0, k,eta, lambda, t, dt)
y0 = 1;
k = 0.6020;
eta = 1.5560;
lambda = 1.9992;
t = 1;
dt = 0.001;

[T,y,Y] = CIRProcess3(y0, k,eta , lambda, t, dt);


figure;
hold on
plot(T, y, 'g');
xlabel 'Time';
ylabel 'Poisson Process';
title 'CIR';
hold off


%[T,y,Y] = CIRProcess2(y0, k,eta, lambda, t, dt)
y0 = 1.25;
k = 5;
eta = 1;
lambda = 2;
t = 1;
dt = 0.001;

[T,y,Y] = CIRProcess3(y0, k,eta , lambda, t, dt);


figure;
hold on
plot(T, y, 'r');
xlabel 'Time';
ylabel 'Poisson Process';
title 'CIR';
hold off

figure;
hold on
plot(T, Y, 'r');
xlabel 'Time';
ylabel 'Poisson Process';
title 'CIR';
hold off