fun = @(x) ((-1).^(-0.5-i*x)).*gamma(0.5+x*i).*(2^(-0.5-x*i))*i;
q = integral(fun,-10,10);
q
