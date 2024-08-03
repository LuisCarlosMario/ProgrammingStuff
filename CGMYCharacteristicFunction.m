function phi = CGMYCharacteristicFunction(u, C, G, M, Y)
    
    phi = exp(C * gamma(-Y) * ( ((M - i*u)^Y) - (M^Y) + ((G+i*u)^Y) - (G^Y) ));
    
end