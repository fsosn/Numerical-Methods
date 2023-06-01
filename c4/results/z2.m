f = @(x) -0.1*x.^3 + 50 + - 0.02*exp(x);
a = -10;
b = 10;
tol = 1e-8;

[root, iterations] = bisection_plot(f,a,b,tol);

fprintf("Bisecton Root found for x = %.8g\n", root);
fprintf("Bisecton Root value = %.8g\n", f(root));
fprintf("Bisecton Number of iterations = %d\n", iterations);