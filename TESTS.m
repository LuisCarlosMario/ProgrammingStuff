%% TESTS $$

%% GAMMA PROCESS %%

a = 4;
b = 2;
T = 1:100;

n=100;
v=zeros([1,n]);

for i=1:n
    G = GammaProcessSV(a, b, T);
    v(i)=G(end);
end



%% VARIANCE GAMMA %%

C = 1;
G = 5;
M = 1;
k = 0;
eta = 0;
lambda = 0;
y0 = 1;
t=1;
dt=0.01;
n = 200;
v = zeros([1,n]);

for i=1:n
    [T,X] = VGSV2(C, G, M, k, eta, lambda, y0, t, dt);
    v(i)=X(end);
end

mean(v)
