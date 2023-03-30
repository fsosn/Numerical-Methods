function [xr, it] = jacobi(A, b)
% A - macierz współczynników lewej strony układu
% b - wektor współczynników prawej strony układu
% xr - wektor rozwiązań równania

if size(A,1) ~= size(A,2)
    error('Macierz A nie jest kwadratowa.');
end
if(size(b,1) ~= size(A,1) || size(b,2) ~= 1)
    error('Niepoprawny wymiar wektora b.');
end

% macierz diagonalna z A
D = diag(diag(A));

% macierz A z wyzerowaną diagonalą
% daje to samo co L + U
LU = A - D;

% wektor startowy
x = zeros(size(A,1), 1);

tolerance = 10e-4;
it = 0;
while norm(b-A*x,2) >= tolerance
    xr = D \ (b - LU*x);
    x = xr;
    it = it+1;
end