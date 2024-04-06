function impedance_delta = impedance_magnitude(omega)
if omega <= 0
    error("Podano zlą omegę");
end
R = 525;
C = 7 * 10^-5;
L = 3;
M = 75; % docelowa wartość modułu impedancji

tempR = 1 / R^2;
tempC = omega * C;
tempL = 1 / (omega * L);
Z = (tempR + (tempC - tempL)^2)^0.5;
Z = 1 / Z;
impedance_delta = Z - M;

end