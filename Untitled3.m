n1=40;
m1=40;

Mat=zeros(n1,m1);
Nat=zeros(n1,m1);

a=2;
b=3;

for m =0:m1
    for n=0:(m + 1)
        Mat(n+1,m+1) = (a^m)*(b^n) / (((factorial(n))^2) * ((factorial(m+1-n))^2));
    end
end

for n =0:n1
    for m=0:m1
        Nat(n+1,m+1) = (a^(m+n-1))*(b^n) / (((factorial(n))^2) * ((factorial(m))^2));
    end
end

sum(sum(Mat))
sum(sum(Nat)) - a^(-1)