%dx = pi/1000;
%V = -pi:dx:pi;

V = 1:0.01:6;
length(V)

p = 100;

%CC = CosSum(V,p);
%DD = DerCosSum(V,p);

%GG = gamma(V);
CC = log(gamma(V));
DD = Digamma(V,p);
TT = Trigamma(V,p);

% Plot of the Delta measure function
figure;
hold on
grid off
plot(V,CC,'r' , V,DD,'b',V ,TT, 'k');
%plot(V,GG,'g', V,CC,'r' , V,DD,'b',V ,TT, 'k');
xlabel 'Stock Price';
ylabel 'Variance gamma values';
title 'Delta';
legend({'Brownian Motion','Variance Gamma Formula'}, 'Location', 'NorthWest');
hold off