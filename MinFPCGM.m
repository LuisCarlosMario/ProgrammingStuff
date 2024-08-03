function X = MinFPCGM(Call, S, K, r ,q, tau, n1, m1, k1, tol, maxIterations, C0, G0, M0, dc, dg, dm) 


    %SC = size(C);
    %lenK = length(K);
    %lenT = length(T);
    X = [C0; G0; M0];
    
    f = [tol; tol; tol];
    
    
    % the Newton method is applied:
    for i = 1:maxIterations
        %if(abs(V) < tol)                                        % if all absolute values of V are smaller than tol the loop terminates
        %    return
        %else
            i
            [COP, CDer, GDer, MDer] = VarianceGammaFewDerivatives(X(1), X(2), X(3), dc, dg, dm, S, K, r ,q, tau, n1, m1, k1);
            
            % computing f:
            VC=CDer.*(COP - Call);
            VC(Call==0) = 0;
            %VC
            f(1) = sum(VC,'all');
            f(1)
            
            VG=GDer.*(COP - Call);
            VG(Call==0) = 0;
            %VG
            f(2) = sum(VG,'all');
            f(2)
            
            VM=MDer.*(COP - Call);
            VM(Call==0) = 0;
            %VM
            f(3) = sum(VM,'all');            
            f(3)
            
            
            X =  f - X ;
            X
            if(abs(f) < tol)
                return
            end
        %end
    end
end