function phi = VGCharacteristicFunction(u, C, G, M)
    
    phi = (G.*M ./ (G.*M + (M - G).*i.*u + u.^2)).^C;
    
end