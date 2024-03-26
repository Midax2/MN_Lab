function zad6()
[numer_indeksu, Edges, I, B, A, b, r] = page_rank()
end

function [numer_indeksu, Edges, I, B, A, b, r] = page_rank()
    numer_indeksu = 196751;
    N = 8;
    d = 0.85;
    Edges = [1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 6, 6, 7, 8;
        6, 4, 8, 4, 5, 3, 5, 6, 7, 6, 5, 6, 4, 4, 7, 6, 6];
    I = speye(N);
    B = sparse(Edges(2,:), Edges(1,:), 1, N, N);
    L = sum(B);
    L = 1 ./ L;
    A = spdiags(L(:), 0, numel(L), numel(L));
    b = [];
    for i = 1:N
        b = [b; (1 - d) / N];
    end
    M = I - d * B * A;
    r = M \ b;
end