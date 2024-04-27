function [V, original_Runge, original_sine, interpolated_Runge, interpolated_sine] = zadanie1()
    % Rozmiar tablic komórkowych (cell arrays) V, interpolated_Runge, interpolated_sine: [1,4].
    % V{i} zawiera macierz Vandermonde wyznaczoną dla liczby węzłów interpolacji równej N(i)
    % original_Runge - wektor wierszowy zawierający wartości funkcji Runge dla wektora x_fine=linspace(-1, 1, 1000)
    % original_sine - wektor wierszowy zawierający wartości funkcji sinus dla wektora x_fine
    % interpolated_Runge{i} stanowi wierszowy wektor wartości funkcji interpolującej 
    %       wyznaczonej dla funkcji Runge (wielomian stopnia N(i)-1) w punktach x_fine
    % interpolated_sine{i} stanowi wierszowy wektor wartości funkcji interpolującej
    %       wyznaczonej dla funkcji sinus (wielomian stopnia N(i)-1) w punktach x_fine
    N = 4:4:16;
    x_fine = linspace(-1, 1, 1000);
    original_Runge = 1 ./ (1 + 25 * x_fine.^2);
    original_sine = sin(2 * pi * x_fine);

    interpolated_Runge = cell(1, length(N));
    interpolated_sine = cell(1, length(N));

    subplot(2,1,1);
    plot(x_fine, original_Runge);
    xlabel('x');
    ylabel('f(x)');
    hold on;
    for i = 1:length(N)
        V{i} = vandermonde_matrix(N(i));
        x_coarse = linspace(-1, 1, N(i));
        y_coarse = 1 ./ (1 + 25 * x_coarse.^2);
        c_runge = V{i} \ y_coarse';
        interpolated_Runge{i} = polyval(flipud(c_runge), x_fine);
        plot(x_fine, interpolated_Runge{i});
    end
    hold off;
    title('Interpolacja funkcji Rungego');
    legend('Funkcja Rungego', 'Interpolacja N=4', 'Interpolacja N=8', 'Interpolacja N=12', 'Interpolacja N=16');

    subplot(2,1,2);
    plot(x_fine, original_sine);
    xlabel('x');
    ylabel('sin(2\pix)');
    hold on;
    for i = 1:length(N)
        x_coarse = linspace(-1, 1, N(i));
        y_coarse = sin(2 * pi * x_coarse);
        c_sine = V{i} \ y_coarse';
        interpolated_sine{i} = polyval(flipud(c_sine), x_fine);
        plot(x_fine, interpolated_sine{i});
    end
    hold off;
    title('Interpolacja funkcji sinusoidalnej');
    legend('Funkcja sinusoidalna', 'Interpolacja N=4', 'Interpolacja N=8', 'Interpolacja N=12', 'Interpolacja N=16');
    saveas(gcf, 'zadanie1.png');
end

function V = vandermonde_matrix(N)
    x = linspace(-1,1,N);
    V = ones(N,N);
    for i = 1:N
        V(:,i) = x.^(i-1);
    end
end