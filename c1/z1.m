clf

f = @(x) 1./(1 + 25 * x.^2);    %rozważana funkcja
x = linspace(-1, 1, 100);       %badany przedział
n = [2, 4, 6, 8];               %stopnie wielomianu

plot(x, f(x))   % wykres dla f(x)
hold on;

%wykresy dla kolejnych stopni wielomianu
for i=1:length(n)
    y = [];
    xn = linspace(-1, 1, n(i)+1);
    fxn = f(xn);
    for k = 1: length(x)
        y = [y newton_int(xn, fxn, x(k))];
    end
    plot(x, y);
    hold on;
end

xlabel('x');
ylabel('y');
title('interpolacja wielomianowa z wykorzystaniem metody Newtona');
legend('f(x)', 'n = 2', 'n = 4', 'n = 6', 'n = 8');
