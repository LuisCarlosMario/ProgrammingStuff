function [T,PP] = PoissonProcess2(t,lambda, n)
    dt=t/n; 
    T=0:dt:t;
    Tjump=-log(rand) / lambda;
    PP=zeros(1,n+1);
    y=0;
    for i = 1:n+1
        if Tjump < dt*i
            Tjump = Tjump -log(rand) / lambda;
            y=y+1;
        end
        PP(i) = y;
    end
    
end