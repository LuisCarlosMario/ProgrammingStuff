function [Pd, X] = PPd(k,lambda)
d=max(size(lambda));
Pd=zeros(k,d);
for j = 1:d
    [P,X] = PP(k,lambda(j));
    Pd(:,1) = P;
end
end