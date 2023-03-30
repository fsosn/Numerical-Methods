function [xr, it,w] = sor(A,b,w)
% A - macierz współczynników lewej strony układu
% b - wektor współczynników prawej strony układu
% xr - wektor rozwiązań równania

if size(A,1) ~= size(A,2)
    error('Macierz A nie jest kwadratowa.');
end
if(size(b,1) ~= size(A,1) || size(b,2) ~= 1)
    error('Niepoprawny wymiar wektora b.');
end
if(w <= 1)
    error('Parametr w musi być większy od 1.');
end

% macierz diagonalna z A
D = diag(diag(A));

% macierz dolna trójkątna bez diagonali 
L = tril(A,-1);

% macierz górna trójkątna bez diagonali 
U = triu(A,1);

% wektor startowy
x = zeros(size(A,1), 1);

tolerance = 10e-4;
it = 0;
while norm(b-A*x,2) >= tolerance
    xr = (D + w*L) \ (w*b - (w*U+(w-1)*D)*x);
    x = xr;
    it = it+1;
end