function d = Digamma(x,n)

le = length(x);
v = zeros(n,le);

for m = 1:n
    v(m,:) = 1/m - 1./(m+x-1);
end

d = psi(1) + sum(v);

end