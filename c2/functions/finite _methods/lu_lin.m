function [x] = lu_lin(A,b)
[L, U, P] = lu(A);
y = L \ (P * b);
x = U \ y;