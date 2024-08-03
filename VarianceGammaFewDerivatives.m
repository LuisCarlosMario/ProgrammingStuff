function [COP, CDer, GDer, MDer] = VarianceGammaFewDerivatives(C, G, M, dc, dg, dm, S, K, r ,q, tau, n1, m1,k1)

    [COP,POP,lo,mu] = VarianceGammaSumFormula(C, G, M, S, K, r ,q, tau, n1, m1,k1);

    %[CC1,POP,lo,mu] = VarianceGammaSumFormula(C-dc, G, M, S, K, r ,q, tau, n1, m1,k1);
    [CC2,POP,lo,mu] = VarianceGammaSumFormula(C+dc, G, M, S, K, r ,q, tau, n1, m1,k1);
    
    %[GC1,POP,lo,mu] = VarianceGammaSumFormula(C, G-dg, M, S, K, r ,q, tau, n1, m1,k1);
    [GC2,POP,lo,mu] = VarianceGammaSumFormula(C, G+dg, M, S, K, r ,q, tau, n1, m1,k1);
    
    %[MC1,POP,lo,mu] = VarianceGammaSumFormula(C, G, M-dm, S, K, r ,q, tau, n1, m1,k1);
    [MC2,POP,lo,mu] = VarianceGammaSumFormula(C, G, M+dm, S, K, r ,q, tau, n1, m1,k1); 
    
    CDer = (CC2 - COP)/dc;
    GDer = (GC2 - COP)/dg;
    MDer = (MC2 - COP)/dm;
    
end