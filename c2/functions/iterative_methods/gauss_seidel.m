function [xr, it] = gauss_seidel(A, b)
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

% macierz dolna trójkątna
L = tril(A);

% macierz górna trójkątna bez diagonali 
U = triu(A,1);

% wektor startowy
x = zeros(size(A,1), 1);

tolerance = 10e-4;
it = 0;
while norm(b-A*x,2) >= tolerance
    xr = L \ (b - U*x);
    x = xr;
    it = it+1;
end