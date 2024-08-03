function mu = Mu(alp, gam, sig, n)
    
    v = zeros(1,n+1);
    mu1 = MuOne(alp, sig);
    
    for i = 0:n
        v(i+1) = (((-1)^i) * gamma(1 + alp*i) * (mu1^i))/ (factorial(i) * gamma(1 + gam*alp*i));
    end
    
    mu = -log(sum(v));
    
end