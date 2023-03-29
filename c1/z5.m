f = @(x) 1./(1+25*x.^2); %rozważana funkcja
x = linspace(-1,1,1000);
fx = f(x);
%stopnie wielomianu
n = 5:15;

%dla newtona
newton_error = zeros(length(n),1);
for i=1:length(n)
    y = [];
    xn = linspace(-1, 1, n(i));
    fxn = f(xn);
    for k = 1: length(x)
        y = [y newton_int(xn, fxn, x(k))];
    end

    newton_error(i) = max(abs(y-fx));
end

%dla wielomianowej
poly_error = zeros(length(n),1);
for i=1:length(n)
    xi = linspace(-1, 1, n(i));
    yi = f(xi);
    p = polyfit(xi, yi, n(i)-1);
    yip = polyval(p,x);

    poly_error(i) = max(abs(yip - fx));    
end

%czebyszew
cheb_error = zeros(length(n),1);
for i = 1:length(n)
    k = 1:n(i);
    xc = cos(pi*(2*k-1)/(2*n(i)));
    yc = f(xc);
    pc = polyfit(xc,yc,n(i)-1);
    y_icn = polyval(pc, x);

    cheb_error(i) = max(abs(y_icn - fx));
end

result = table(n', newton_error,poly_error, cheb_error);
result.Properties.VariableNames{1} = 'Stopień n';
result.Properties.VariableNames{2} = 'ΔFn(x) dla interpolacji wielomianowej (metoda Newtona)';
result.Properties.VariableNames{3} = 'ΔFn(x) dla aproksymacji wielomianowej';
result.Properties.VariableNames{4} = 'ΔFn(x) dla interpolacji węzłami Czebyszewa';
disp(result);