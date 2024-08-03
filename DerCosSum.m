function d = DerCosSum(x,n)

le = length(x);
v = zeros(n,le);

for m = 1:n
    v(m,:) = (-1)^m * x.^(2*m - 1) ./ factorial(2*m - 1);
end

d = sum(v);

end