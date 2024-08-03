function [K,COP] = CallOptionVG2(C, G, M, S0, K, r ,q, t, dt, ite)
    
    V = zeros([ite,1]);
    
    for i = 1:ite
        [T,S] = StockPriceVG(C, G, M, S0, r ,q, t, dt);
        V(i) = S(end);
    end
    Mat = (V - K');
    Mat(Mat<0) = 0;
    COP = exp(-r*t)'.*mean(Mat);
end