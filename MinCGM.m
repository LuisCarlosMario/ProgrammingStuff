function X = MinCGM(Call, S, K, r ,q, tau, n1, m1,k1, tol, maxIterations, C0, G0, M0, dc, dg, dm) 


    %SC = size(C);
    %lenK = length(K);
    %lenT = length(T);
    %C = C0; 
    %G = G0;
    %M = M0;
    X = [C0; G0; M0];
    
    f = [tol; tol; tol];
    Df = eye(3);
    
    
    % the Newton method is applied:
    for i = 1:maxIterations
        %if(abs(V) < tol)                                        % if all absolute values of V are smaller than tol the loop terminates
        %    return
        %else
            i
            X
            [COP,CDer,GDer,MDer, CCDer, GGDer, MMDer, CGDer, CMDer, GMDer] = VarianceGammaDerivatives(X(1), X(2), X(3), dc, dg, dm, S, K, r ,q, tau, n1, m1,k1); 
            
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
            
            % computing Df:
            M11=CCDer.*(COP - Call) + CDer.^2;
            M11(Call==0) = 0;
            Df(1,1) = sum(M11,'all');
            Df(1,1)
            
            M12=CGDer.*(COP - Call) + CDer.*GDer;
            M12(Call==0) = 0;
            Df(1,2) = sum(M12,'all');
            Df(1,2)
            
            M13=CMDer.*(COP - Call) + CDer.*MDer;
            M13(Call==0) = 0;
            Df(1,3) = sum(M13,'all');
            Df(1,3)
            
            M21=CGDer.*(COP - Call) + CDer.*GDer;
            M21(Call==0) = 0;
            Df(2,1) = sum(M21,'all');
            Df(2,1)
            
            M22=GGDer.*(COP - Call) + GDer.^2;
            M22(Call==0) = 0;
            Df(2,2) = sum(M22,'all');
            Df(2,2)
            
            M23=GMDer.*(COP - Call) + GDer.*MDer;
            M23(Call==0) = 0;
            Df(2,3) = sum(M23,'all');
            Df(2,3)
            
            M31=CMDer.*(COP - Call) + CDer.*MDer;
            M31(Call==0) = 0;
            Df(3,1) = sum(M31,'all');
            Df(3,1)
            
            M32=GMDer.*(COP - Call) + GDer.*MDer;
            M32(Call==0) = 0;
            Df(3,2) = sum(M32,'all');
            Df(3,2)
            
            M33=MMDer.*(COP - Call) + MDer.^2;
            M33(Call==0) = 0;
            Df(3,3) = sum(M33,'all');
            Df(3,3)
            
            X = X - (Df^(-1))*f ;
            if(abs(f) < tol)
                return
            end
        %end
    end
end