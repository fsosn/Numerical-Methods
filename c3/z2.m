clear;
clf;
f = @(x) x.*exp(x);
a = -1; 
b = 1; 
exact_value = 0.735759; % wartość docelowa całki

n = 12:12:240; % liczba podprzedziałów
errors = zeros(4, numel(n)); % macierz błędów

for i = 1:numel(n)
    x = linspace(a, b, n(i)+1);
    h = (b-a)/n(i);
    f_vals = f(x);
    errors(1, i) = abs(exact_value - nc(f_vals, h, 1));
    errors(2, i) = abs(exact_value - nc(f_vals, h, 2));
    errors(3, i) = abs(exact_value - nc(f_vals, h, 3));
    errors(4, i) = abs(exact_value - nc(f_vals, h, 4));
end

% Wykres zależności błędu bezwzględnego od liczby podprzedziałów
semilogy(n, errors(1, :), '-', 'DisplayName', 'Wzór trapezów');
hold on;
semilogy(n, errors(2, :), '-', 'DisplayName', 'Wzór Simpsona');
semilogy(n, errors(3, :), '-', 'DisplayName', 'Reguła 3/8');
semilogy(n, errors(4, :), '-', 'DisplayName', 'Wzór Boole''a');
xlabel('Liczba podprzedziałów');
ylabel('Błąd bezwzględny');
title('Zależność błędu bezwzględnego od liczby podprzedziałów');
legend('Location', 'best');