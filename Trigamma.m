function d = Trigamma(x,n)

le = length(x);
v = zeros(n+1,le);

for m = 0:n
    v(m+1,:) = (m+x).^(-2);
end

d = sum(v);
end