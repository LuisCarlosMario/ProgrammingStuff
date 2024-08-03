function phi = CharacteristicFunctionCIR(u, k ,eta, lambda, y0, T)
    
    gamma = sqrt((k^2)-2*(lambda^2)*i*u);
    phi1 = exp((k^2)*eta.*T./(lambda^2)).*exp(2*y0*i*u./(k+gamma*coth(gamma.*T/2)));
    phi2 = (cosh(gamma.*T/2) + (k/gamma)*sinh(gamma.*T/2)).^(2 * k * eta / (lambda^2));
    phi = phi1 ./ phi2;
    
end