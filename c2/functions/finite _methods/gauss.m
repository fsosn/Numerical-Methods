function [x] = gauss(A, b)
% metoda elimacji Gaussa z częściowym wyborem elementu podstawowego
% (tworzenie macierzy permutacji)

n = length(A);

% macierz permutacji
P = eye(n);

for k = 1:n-1

    % wyznaczenie elementu głównego
    [~, j] = max(abs(A(k:n,k)));
    j = j + k - 1;

    % zamiana wiersza k z wierszem z elementem głównym
    if j ~= k
        P([k,j], :) = P([j,k], :);
        A([k,j], :) = A([j,k], :);
        b([k,j]) = b([j,k]);
    end

    % eliminacja gaussa
    for i = k+1:n
        czynnik = A(i,k)/A(k,k);
        A(i,k+1:n) = A(i,k+1:n) - czynnik*A(k,k+1:n);
        b(i) = b(i) - czynnik*b(k);
    end
end

x = zeros(n,1);
for k = n:-1:1
    x(k) = (b(k) - A(k,k+1:n)*x(k+1:n))/A(k,k);
end

% końcowy wynik
x = P*x;