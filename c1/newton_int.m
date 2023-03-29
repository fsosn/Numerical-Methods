function xv = newton_int(x, y, xi)
% x - wektor punktów na osi x
% y - wektor punktów na osi x
% xi - wektor punktów do interpolacji

n = length(x);
d = zeros(n, n);    % tworzę macierz o wymiarach n x n
d(:,1) = y(:);      % wstawiona pierwsza kolumna to y

%tablica różnic dzielonych (divided differences table)
for j = 2:n
    for i = 1:n-j+1
        d(i,j) = (d(i+1,j-1) - d(i,j-1)) / (x(i+j-1) - x(i));
    end
end

%interpolacja punktu xi
prod = 1;
sum = d(1,1);
for j = 1: n-1
    prod = prod.*(xi-x(j));
    sum = sum +d(1,j+1).*prod;
end
xv = sum;
end