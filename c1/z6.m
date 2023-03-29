f = @(x) 1./(1+25*x.^2); %rozważana funkcja
x = linspace(-1,1,1000);
fx = f(x);

threshold = 10e-4;

%stopnie wielomianu
n = 5:15;

%dla interpolacji wielomianowej metodą newtona
newton_error_rel = zeros(length(n),1);
for i=1:length(n)
    y = [];
    xn = linspace(-1, 1, n(i));
    fxn = f(xn);
    for k = 1: length(x)
        y = [y newton_int(xn, fxn, x(k))];
    end

    newton_error_rel(i) = max(abs((y-fx)/fx.*(fx>threshold)));
end

%dla aproksymacji wielomianowej
poly_error_rel = zeros(length(n),1);
for i=1:length(n)
    xi = linspace(-1, 1, n(i));
    xi = setdiff(xi, xi(indices));
    yi = f(xi);
    p = polyfit(xi, yi, n(i)-1);
    yip = polyval(p,x);

    poly_error_rel(i) = max(abs((yip - fx)/fx.*(fx>threshold)));    
end

%czebyszew
cheb_error_rel = zeros(length(n),1);
for i = 1:length(n)
    k = 1:n(i);
    xc = cos(pi*(2*k-1)/(2*n(i)));
    xc = setdiff(xc, xc(indices));
    yc = f(xc);
    pc = polyfit(xc,yc,n(i)-1);
    y_icn = polyval(pc, x);

    cheb_error_rel(i) = max(abs((y_icn - fx)/fx.*(fx>threshold)));
end

result = table(n', newton_error_rel,poly_error_rel, cheb_error_rel);
result.Properties.VariableNames{1} = 'Stopień n';
result.Properties.VariableNames{2} = 'δFn(x) dla interpolacji wielomianowej (metoda Newtona)';
result.Properties.VariableNames{3} = 'δFn(x) dla aproksymacji wielomianowej';
result.Properties.VariableNames{4} = 'δFn(x) dla interpolacji węzłami Czebyszewa';
disp(result);