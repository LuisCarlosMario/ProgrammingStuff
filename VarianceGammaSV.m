function [T,X] = VarianceGammaSV(C, G, M, k, eta, lambda, y0, t, dt)
    
    [T,y,Y] = CIRProcess(y0, k,eta , lambda, t, dt);
    T=0:dt:t;
    G1 = GammaProcessSV(C, M, Y);
    G2 = GammaProcessSV(C, G, Y);
    
    X = G1 - G2;
    
end