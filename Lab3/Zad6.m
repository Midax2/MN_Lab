function Zad6
load('filtr_dielektryczny.mat', 'A', 'b');
N = size(A);
N = N(1);
[err_norm_G] = solve_Gauss_Seidel(N, A, b);
[err_norm_J] = solve_Jacobi(N, A, b);
[err_norm_D] = solve_direct(A, b);
disp(err_norm_J, err_norm_G, err_norm_D);
end

function [err_norm_J] = solve_Jacobi(N, A, b)
L = tril(A, -1);
U = triu(A, 1);
D = diag(diag(A));
x = ones(N, 1);
inv_D = diag(1 ./ diag(D));
M = -inv_D * (L + U);
bm = inv_D * b;
iterations = -1;
err_norm_J = 1;
while err_norm_J >= 10^-12 && iterations < 1000
    iterations = iterations + 1;
    err_norm_J = norm(A*x-b);
    x = M * x + bm;
end
end

function [err_norm_G] = solve_Gauss_Seidel(N, A, b)
L = tril(A, -1);
U = triu(A, 1);
D = diag(diag(A));
x = ones(N, 1);
I = eye(size(D));
inv_DpL = (D + L) \ I;
M = -inv_DpL * U;
bm = inv_DpL * b;
iterations = -1;
err_norm_G = 1;
while err_norm_G >= 10^-12 && iterations < 1000
    iterations = iterations + 1;
    err_norm_G = norm(A*x-b);
    x = M * x + bm;
end
end

function [err_norm_D] = solve_direct(A, b)
x = A\b;
err_norm_D = norm(A*x-b);
end

