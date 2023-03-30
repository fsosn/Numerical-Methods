% -----------------------------------------------------------------
%                           mac_3
% -----------------------------------------------------------------
clear; 
[A,b] = mac_3(0.1);

w = 1.06;
[x_j, it_j] = jacobi(A,b);
[x_gs, it_gs] = gauss_seidel(A,b);
[x_sor, it_sor] = sor(A,b,w);

x_j = round(x_j*1000)/1000;
x_gs = round(x_gs*1000)/1000;
x_sor = round(x_sor*1000)/1000;

D = diag(diag(A));
LU = A - D;
J = -inv(D)*(A);
rj = max(abs(eig(J)));

L = tril(A);
U = triu(A,1);
GS = -inv(L+D)*U;
rgs = max(abs(eig(GS)));

L = tril(A,-1);
U = triu(A,1);
S = (D/w - L)\(((1-w)*D/w) + U);
rs = max(abs(eig(S)));

fprintf('Wyniki dla danych mac_3:\n');
fprintf('-------------------------------------------------------------------------------------\n');
fprintf('Metoda Jakobiego:\n');
fprintf('Wektor rozwiązań x: [');
fprintf('%g, ', x_j(1:end-1));
fprintf('%g]\n', x_j(end));
fprintf('Liczba iteracji: %d\n', it_j);
fprintf('Promień spektralny: %g\n', rj);
fprintf('-------------------------------------------------------------------------------------\n');
fprintf('Metoda Gaussa-Seidla:\n');
fprintf('Wektor rozwiązań x: [');
fprintf('%g, ', x_gs(1:end-1));
fprintf('%g]\n', x_gs(end));
fprintf('Liczba iteracji: %d\n', it_gs);
fprintf('Promień spektralny: %g\n', rgs);
fprintf('-------------------------------------------------------------------------------------\n');
fprintf('Metoda SOR:\n');
fprintf('Wektor rozwiązań x: [');
fprintf('%g, ', x_sor(1:end-1));
fprintf('%g]\n', x_sor(end));
fprintf('Liczba iteracji: %d\n', it_sor);
fprintf('Współczynnik omega: %g\n', w);
fprintf('Promień spektralny: %g\n', rs);
fprintf('-------------------------------------------------------------------------------------\n');