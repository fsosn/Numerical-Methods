clf;
clear;

%rozważana funkcja
f = @(x) 1./(1+25*x.^2); 
x = linspace(-1,1,1000);
fx = f(x);

%i to liczba punktów
least_points = 10;
max_points = 20;
points = max_points - least_points;

threshold = 10e-4;

poly_err = zeros(points,1);
cheb_err = zeros(points,1);

it = 1;
for i = least_points:max_points
    % aproksymacja wielomianowa
    xi = linspace(-1,1,i);  % i punktów
    yi = f(xi);
    p = polyfit(xi, yi, i-1);
    y = polyval(p, x);
    poly_err(it) = max(abs((y-fx)/fx.*(fx>threshold)));
    plot(i, max(abs((y-fx)/fx.*(fx>threshold))), '.b','MarkerSize', 20);
    hold on;
    
    % węzły czebyszewa interpolacja
    k = 1:i;
    xc = cos(pi*(2*k-1)/(2*i));
    yc = f(xc);
    pc = polyfit(xc,yc,i-1);
    y_icn = polyval(pc, x);
    cheb_err(it) = max(abs((y_icn-fx)/fx.*(fx>threshold)));
    plot(i, max(abs((y_icn-fx)/fx.*(fx>threshold))), '.r','MarkerSize', 20);
    hold on;

    it = it+1;
    
end

xticks(least_points:max_points);
xlabel('Liczba węzłów');
ylabel('Błąd względny');
legend('Aproksymacja wielomianowa', 'Interpolacja przy użyciu wielomianów Czebyszewa');