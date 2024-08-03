function [CP,K] = CallOptionPrice(C, G, M, S0, r, T, alpha, eta, N)
    
    v = 0:N-1;
    theta = log(S0);
    lambda = 2*pi / (N*eta);
    b = lambda*(N-1)/2;
    
    psi = VGFourierTransform( eta*v , C, G, M, r, T, alpha);
    ex = exp(i*eta*v*(theta-b));
    w = [1/2,ones([1,N-2]),1/2];
    
    K = log(theta - b + lambda*v );
    X = (exp(-alpha*theta-r*T)/pi)*eta*psi.*ex.*w;
    CP = real(fft(X));
    
end