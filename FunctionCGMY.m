function [T,X] = FunctionCGMY(C, G, M, Y, x)
    
    if(x < 0)
        C*exp(G*x)*(-x)^(-1-Y)
    if(x > 0)
        C*exp(-M*x)*(-x)^(-1-Y)
    end
    
end