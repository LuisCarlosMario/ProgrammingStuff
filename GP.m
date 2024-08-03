%[T,G] = GammaProcess(a, b, t, n);
[T,G] = GammaProcess(10, 20, 1, 10000);
%[T,X] = VarianceGamma2(C, G, M, t, n)
[TVG,X] = VarianceGamma2(20, 40, 50, 1, 10000);
%[T,X] = VarianceGamma2(C, G, M, t, n)
[TVG2,X2] = VarianceGamma2(1.3574, 5.8704, 14.2699, 100, 1000000);
%[T,Y] = CIRProcess(y0, k,eta, lambda, t, n)
[Time,y,Y] = CIRProcess(1.25 ,5,1, 2, 1, 10000);
%[T,Y] = CIRProcess(y0,k,eta, lambda, t, n)
[Time2,y2,Y2] = CIRProcess(0 ,0.6020 ,1.5560 , 1.9992, 100, 10000);


figure;
hold on
plot(T,G, 'r');
xlabel 'Time';
ylabel 'Poisson Process';
title 'Poisson Motion';
hold off

figure;
hold on
plot(TVG, X, 'g');
xlabel 'Time';
ylabel 'Poisson Process';
title 'Poisson Motion';
hold off

figure;
hold on
plot(TVG2, X2, 'b');
xlabel 'Time';
ylabel 'Poisson Process';
title 'Poisson Motion';
hold off


figure;
hold on
plot(Time, y, 'r');
xlabel 'Time';
ylabel 'Poisson Process';
title 'Poisson Motion';
hold off


figure;
hold on
plot(Time, Y, 'r');
xlabel 'Time';
ylabel 'Poisson Process';
title 'Poisson Motion';
hold off


figure;
hold on
plot(Time2, Y2, 'r');
xlabel 'Time';
ylabel 'Poisson Process';
title 'Poisson Motion';
hold off
