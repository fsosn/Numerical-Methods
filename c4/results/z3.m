f = @(x) -0.1*x.^3 + 50 + - 0.02*exp(x);
a = -10;
b = 10;
tol = 1e-7;
init_guess = -10;
dx = 1e-1;

[root, iterations] = newton_raphson_plot(f,a,b,tol,init_guess,dx);

fprintf("Newton Rophson Root found for x = %.7g\n", root);
fprintf("Newton Rophson Root value = %.7g\n", f(root));
fprintf("Newton Rophson Number of iterations = %d\n", iterations);