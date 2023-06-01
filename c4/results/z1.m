f = @(x) -0.1*x.^3 + 50 + - 0.02*exp(x);
n = 2000;
x = linspace(a,b,n);
y = f(x);
plot(x, y, 'Color', 'r')
xlabel('x')
ylabel('y')
title('y = -0.1*x^3 + 50 - 0.02*e^x')
grid on
hold on
line(xlim, [0 0], 'Color', 'k', 'LineStyle', '--')