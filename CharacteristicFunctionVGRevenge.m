function phi = CharacteristicFunctionVGRevenge(u, C, G, M, TM)
    
    phi = (G*M ./ (G*M + (M - G)*i*u + u^2)).^(C*TM);

end
