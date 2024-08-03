function g = JohnksGammaGeneratorRevenge(a,TM)
          
    % Inputs:
    % a - parameter a of the Johnk's Gamma Generator
    % TM - time matrix
    
    % Outputs:
    % g - value matrix generated by the Johnk's Gamma Generator

    n = size(a,1);
    m = size(a,2);
    E = exprnd(1,[n,m]);
    g=zeros(n,m);
    
    for j=1:m
        for i=1:n
            if(TM(i,j) ~= 0 || i == 1)
                X=1;
                Y=1;
                a1=a(i,j);
                while(X + Y > 1)
                    U = rand([1,2]);
                    X = (U(1))^(1/a1);
                    Y =(U(2)^(1/(1-a1)));
                end
                g(i,j) = X*E(i,j) / (X+Y);
            end
        end
    end
end