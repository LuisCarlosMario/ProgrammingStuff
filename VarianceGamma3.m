function [T,X] = VarianceGamma3(C, G, M, t, dt)
    
    [T,G1] = GammaProcess5(C, M, t, dt);
    [T2,G2] = GammaProcess5(C, G, t, dt);
    
    X = G1 - G2;
    
end