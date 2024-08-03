function [COP,CDer,GDer,MDer, CCDer, GGDer, MMDer, CGDer, CMDer, GMDer] = VarianceGammaDerivatives(C, G, M, dc, dg, dm, S, K, r ,q, tau, n1, m1,k1)

    [COP,POP,lo,mu] = VarianceGammaSumFormula(C, G, M, S, K, r ,q, tau, n1, m1,k1);

    [CC1,POP,lo,mu] = VarianceGammaSumFormula(C-dc, G, M, S, K, r ,q, tau, n1, m1,k1);
    [CC2,POP,lo,mu] = VarianceGammaSumFormula(C+dc, G, M, S, K, r ,q, tau, n1, m1,k1);
    
    [GC1,POP,lo,mu] = VarianceGammaSumFormula(C, G-dg, M, S, K, r ,q, tau, n1, m1,k1);
    [GC2,POP,lo,mu] = VarianceGammaSumFormula(C, G+dg, M, S, K, r ,q, tau, n1, m1,k1);
    
    [MC1,POP,lo,mu] = VarianceGammaSumFormula(C, G, M-dm, S, K, r ,q, tau, n1, m1,k1);
    [MC2,POP,lo,mu] = VarianceGammaSumFormula(C, G, M+dm, S, K, r ,q, tau, n1, m1,k1);
    
    %[CGC11,POP,lo,mu] = VarianceGammaSumFormula(C-dc, G-dg, M, S, K, r ,q, tau, n1, m1,k1);
    %[CGC12,POP,lo,mu] = VarianceGammaSumFormula(C-dc, G+dg, M, S, K, r ,q, tau, n1, m1,k1);
    %[CGC21,POP,lo,mu] = VarianceGammaSumFormula(C+dc, G-dg, M, S, K, r ,q, tau, n1, m1,k1);
    [CGC,POP,lo,mu] = VarianceGammaSumFormula(C+dc, G+dg, M, S, K, r ,q, tau, n1, m1,k1);
    
    %[CMC11,POP,lo,mu] = VarianceGammaSumFormula(C-dc, G, M-dm, S, K, r ,q, tau, n1, m1,k1);
    %[CMC12,POP,lo,mu] = VarianceGammaSumFormula(C-dc, G, M+dm, S, K, r ,q, tau, n1, m1,k1);
    %[CMC21,POP,lo,mu] = VarianceGammaSumFormula(C+dc, G, M-dm, S, K, r ,q, tau, n1, m1,k1);
    [CMC,POP,lo,mu] = VarianceGammaSumFormula(C+dc, G, M+dm, S, K, r ,q, tau, n1, m1,k1);
    
    %[GMC11,POP,lo,mu] = VarianceGammaSumFormula(C, G-dg, M-dm, S, K, r ,q, tau, n1, m1,k1);
    %[GMC12,POP,lo,mu] = VarianceGammaSumFormula(C, G-dg, M+dm, S, K, r ,q, tau, n1, m1,k1);
    %[GMC21,POP,lo,mu] = VarianceGammaSumFormula(C, G+dg, M-dm, S, K, r ,q, tau, n1, m1,k1);
    [GMC,POP,lo,mu] = VarianceGammaSumFormula(C, G+dg, M+dm, S, K, r ,q, tau, n1, m1,k1);    
    
    CDer = (CC2 - COP)/dc;
    GDer = (GC2 - COP)/dg;
    MDer = (MC2 - COP)/dm;
    
    CCDer = (CC2 - 2*COP + CC1)/(dc^2);
    GGDer = (GC2 - 2*COP + GC1)/(dg^2);
    MMDer = (MC2 - 2*COP + MC1)/(dm^2);
    
    CGDer = (CGC - CC2 - GC2 + COP)/(dc*dg);
    CMDer = (CMC - CC2 - MC2 + COP)/(dc*dm);
    GMDer = (GMC - GC2 - MC2 + COP)/(dg*dm);
    
end