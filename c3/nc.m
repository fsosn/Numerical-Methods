function I = nc(f_vals, h, d)
% d:
% 1 - wzór trapezów
% 2 - wzór Simpsona
% 3 - reguła 3/8
% 4 - wzór Boole'a
%
% https://pl.wikipedia.org/wiki/Metody_Newtona-Cotesa

I = 0;
n = length(f_vals)-1;
switch d
    case 1
        for i = 1:n
            I = I + h/2 * (f_vals(i) + f_vals(i+1));
        end
    case 2
        for i = 1:2:n-1
            I = I + h/3 * (f_vals(i) + 4*f_vals(i+1) + f_vals(i+2));
        end
    case 3
        for i = 1:3:n-2
            I = I + 3*h/8 * (f_vals(i) + 3*f_vals(i+1) + 3*f_vals(i+2) + f_vals(i+3));
        end
    case 4
        for i = 1:4:n-3
            I = I + 2*h/45 * (7*f_vals(i) + 32*f_vals(i+1) + 12*f_vals(i+2) + 32*f_vals(i+3) + 7*f_vals(i+4));
        end
    otherwise
        error('Brak podanego rzędu metody całkowania.\n');
end