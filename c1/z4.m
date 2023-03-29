clf;
clear;

%rozważana funkcja
f = @(x) 1./(1+25*x.^2); 
x = linspace(-1,1,1000);

%i to liczba punktów
it = 1;
for i = 8:1:11
    % liniowo rozmieszczone punkty
    xi = linspace(-1,1,i);  % i punktów
    yi = f(xi);
    p = polyfit(xi, yi, i-1);
    y_int = polyval(p, x);
    
    % węzły czebyszewa
    k = 1:i;
    xc = cos(pi*(2*k-1)/(2*i));
    yc = f(xc);
    pc = polyfit(xc,yc,i-1);
    y_icn = polyval(pc, x);
    
    % tworzę wykres
    subplot(2,2, it)
    plot(x, f(x), 'r', x, y_int, 'b', x, y_icn, 'g', xc, yc, 'og', xi, yi, 'ob');
    title([num2str(i),' węzłów'])
    legend('f(x) = 1/(1+25x^2)', ['interpolacja wielomianowa'], ...
       'interpolacja przy użyciu węzłów Czebyszewa', 'węzły Czebyszewa', 'punkty');
    xlabel('x');
    ylabel('y');

    it = it+1;
end