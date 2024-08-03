function CM = cummean(V)
    
    n = length (V);
    CM = zeros([1,n]);
    for i = 1:n
        CM(i) = mean(V(1:i));
    end
    
end
