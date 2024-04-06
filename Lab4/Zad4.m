function Zad4
a = 1;
b = 50;
ytolerance = 1e-12;
max_iterations = 100;

[omega_bisection, ~, ~, xtab_bisection, xdif_bisection] = bisection_method(a, b, max_iterations, ytolerance, @impedance_magnitude);
[omega_secant, ~, ~, xtab_secant, xdif_secant] = secant_method(a, b, max_iterations, ytolerance, @impedance_magnitude);

figure;
subplot(2,1,1);
plot(xtab_bisection, '-o', 'DisplayName', 'Bisekcja');
hold on;
plot(xtab_secant, '-x', 'DisplayName', 'Sieczne');
xlabel('Iteracje');
ylabel('Wartość xsolution');
title('Zmiany w kolejnych iteracjach');
legend('Location', 'best');

subplot(2,1,2);
semilogy(xdif_bisection, '-o', 'DisplayName', 'Bisekcja');
hold on;
semilogy(xdif_secant, '-x', 'DisplayName', 'Sieczne');
xlabel('Iteracje');
ylabel('Wartość xdif');
title('Różnice w kolejnych iteracjach');
legend('Location', 'best');

end