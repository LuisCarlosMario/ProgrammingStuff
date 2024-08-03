%% TESTS 2 $$

%% CIR PROCESS %%

y0 = 100;
k = 2;
eta = 0;
lambda = 2;
dt = 0.01;
t = 1;

n=10000;
v=zeros([1,n]);

for i=1:n
    [T,y,Y] = CIRProcess3(y0, k ,eta, lambda, t, dt);
    v(i)=y(end);
end

mean(v)