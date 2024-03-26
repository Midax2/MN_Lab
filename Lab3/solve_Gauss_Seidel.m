function [A,b,M,bm,x,err_norm,time,iterations,index_number] = solve_Gauss_Seidel(N)
% A - macierz rzadka z równania macierzowego A * x = b
% b - wektor prawej strony równania macierzowego A * x = b
% M - macierz pomocnicza opisana w instrukcji do Laboratorium 3
% bm - wektor pomocniczy opisany w instrukcji do Laboratorium 3
% x - rozwiązanie równania macierzowego
% err_norm - norma błędu rezydualnego rozwiązania x; err_norm = norm(A*x-b)
% time - czas wyznaczenia rozwiązania x
% iterations - liczba iteracji wykonana w procesie iteracyjnym metody Gaussa-Seidla
% index_number - Twój numer indeksu
index_number = 196751;
L1 = 1;
[A,b] = generate_matrix(N, L1);
L = tril(A, -1);
U = triu(A, 1);
D = diag(diag(A));
x = ones(N, 1);
I = eye(size(D));
inv_DpL = (D + L) \ I;
M = -inv_DpL * U;
bm = inv_DpL * b;
iterations = -1;
err_norm = 1;
tic;
while err_norm >= 10^-12 && iterations < 1000
    iterations = iterations + 1;
    err_norm = norm(A*x-b);
    x = M * x + bm;
end
time = toc;
end
