[T,X] = BrownianMotionDrift(1,2,10, 10000);
%[time,P] = PoissonProcess2(10,2,10000);
%[time2,P2] = PoissonProcess3(10,2,10000);
%[TN,PN] = CompoundPoissonNormal(10, 2 , 10000, 0, 1.5);
%[T,X] = JumpDiffusions(b,sig,lambda, mean2, vol2, t, n)
%[TJD,XJD] = JumpDiffusions(2, 2, 2, 0, 4, 10, 10000);
%[TVG,XVG] = VarianceGamma(sig,theta, k, t, n);
[TVG,XVG] = VarianceGamma(1.9992, 1.5560, 0.6020, 1, 10);



figure;
hold on
plot(T,X, 'b');
xlabel 'Time';
ylabel 'Wiener Process';
title 'Brownian Motion';
hold off



%figure;
%hold on
%plot(time,P, 'r');
%xlabel 'Time';
%ylabel 'Poisson Process';
%title 'Poisson Motion';
%hold off


figure;
hold on
plot(TVG,XVG, 'g');
xlabel 'Time';
ylabel 'Poisson Process';
title 'Poisson Motion';
hold off


%figure;
%hold on
%plot(TN,PN, 'b');
%xlabel 'Time';
%ylabel 'Poisson Process';
%title 'Poisson Motion';
%hold off

%figure;
%hold on
%plot(TJD,XJD, 'b');
%xlabel 'Time';
%ylabel 'Poisson Process';
%title 'Poisson Motion';
%hold off

