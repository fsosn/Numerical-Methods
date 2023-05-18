function I = nc_basic(f, a, b, option)
% option:
% 1 - kw. prostokątów
% 2 - kw. trapezów
% 3 - kw. Simpsona
% 4 - kw. 3/8

switch option
    case 1
        c = (a+b)/2;
        I = f(c)*(b-a);
    case 2
        I = (b-a)/2 * (f(a)+f(b));
    case 3
        c = (a+b)/2;
        I = (b-a)/6 * (f(a)+4*f(c)+f(b));
    case 4
        c = (2*a+b)/3;
        d = (a+2*b)/3;
        I = (b-a)/8 * (f(a) + 3*f(c) + 3*f(d) + f(b));
end