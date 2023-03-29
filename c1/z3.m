clf;
clear;

%rozważana funkcja
f = @(x) 1./(1+25*x.^2); 
x = linspace(-1,1,1000);

it = 1;
for i = 8:1:11
    xi = linspace(-1,1,i);
    yi = f(xi);
    p = polyfit(xi, yi, i-1);
    y_int = polyval(p, x);

    subplot(2,2, it)
    plot(x, f(x), 'r', x, y_int, 'b', xi, yi, 'ob');
    title(['Interpolacja wielomianowa dla ',num2str(i), ' punktów']);
    legend('f(x) = 1 / (1 + 25x^2)', 'interpolacja', 'węzły');
    xlabel('x');
    ylabel('y');
    
    it = it+1;
end