function [CP,K] = CallOptionPrice2(C, G, M, S0, Kmax, r, T, alpha, N)
    
    J = 0:N-1;
    theta = log(S0);
    b = log(Kmax / S0);
    lambda = 2*b / (N - 1);
    eta = 2*pi / (N*lambda);
    
    
    psi = VGFourierTransform( eta*J , C, G, M, r, T, alpha);
    ex = exp(i*eta*J*(theta-b));
    w = [1/2,ones([1,N-2]),1/2];
    const = exp(-alpha*k -)
    
    K = log(theta - b + lambda*J );
    X = (exp(-alpha*theta-r*T)/pi)*eta*psi.*ex.*w;
    CP = real(fft(X));
    
end