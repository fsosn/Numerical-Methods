f = @(x) x.*exp(x);
a = -1;
b = 1;

I_prostokat = nc_basic(f, a, b,1);
I_trapez = nc_basic(f, a, b, 2);
I_simpson = nc_basic(f, a, b, 3);
I_38 = nc_basic(f, a, b, 4);

fprintf('---------------------------------------------------------------------------\n');
fprintf('Dla funkcji f(x) = x*exp(x) i przedziału x<%d;%d>, wartość całki\n', a, b);
fprintf('oznaczonej obliczonej według następujących kwadratur Newtona-Cotesa wynosi:\n');
fprintf('- kw. prostokątów: \tI = %.6f\n', I_prostokat);
fprintf('- kw. trapezów: \tI = %.6f\n', I_trapez);
fprintf('- kw. Simpsona: \tI = %.6f\n', I_simpson);
fprintf('- kw. 3/8: \t\t\tI = %.6f\n', I_38);
fprintf('\nDla porównania, rozwiązanie dokładne to I = 0.735759\n');

f = @(x) sqrt(1-x.^2);
I_prostokat = nc_basic(f, a, b,1);
I_trapez = nc_basic(f, a, b, 2);
I_simpson = nc_basic(f, a, b, 3);
I_38 = nc_basic(f, a, b, 4);

fprintf('---------------------------------------------------------------------------\n');
fprintf('Dla funkcji f(x) = sqrt(1-x^2) i przedziału x<%d;%d>, wartość całki\n', a, b);
fprintf('oznaczonej obliczonej według następujących kwadratur Newtona-Cotesa wynosi:\n');
fprintf('- kw. prostokątów: \tI = %.6f\n', I_prostokat);
fprintf('- kw. trapezów: \tI = %.6f\n', I_trapez);
fprintf('- kw. Simpsona: \tI = %.6f\n', I_simpson);
fprintf('- kw. 3/8: \t\t\tI = %.6f\n', I_38);
fprintf('\nDla porównania, rozwiązanie dokładne to I = 1.570796\n');