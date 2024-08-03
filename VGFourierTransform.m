function psi = VGFourierTransform(v, C, G, M, r, T, alpha)

    phi = VGCharacteristicFunction(v - i*(1 + alpha), C, G, M);

    psi = exp(-r*T).*phi ./(alpha^2 + alpha - v.^2 + i*v.*(2*alpha + 1));
    
end