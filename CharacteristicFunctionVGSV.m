function phi = CharacteristicFunctionVGSV(u, C, G, M, k ,eta, lambda, y0, T)
    
    CFVG = CharacteristicFunctionVG(u, C, G, M, 1);
    phi = CharacteristicFunctionCIR(-i*log(CFVG), k ,eta, lambda, y0, T);
        
end