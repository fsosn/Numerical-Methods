clf;
clear;
% rozważana funkcja
f = @(x) 1./(1+25*x.^2); 

% badany przedział
x = linspace(-1, 1, 100); 
fx = f(x);

% badane stopnie wielomianu
n = [3,5,7,11]; 

%   k to liczba węzłów aproksymacji

% ------------------------------------------------------ 
%                   dla k = n+2
% ------------------------------------------------------ 
subplot(1,3,1);
plot(x, fx, 'DisplayName', ['f(x)'], 'LineWidth', 2);
hold on;
for i = n
    k = i+2;
    xi = linspace(-1, 1, k);
    yi = f(xi);
    p = polyfit(xi, yi, i-1);
    y_int = polyval(p,x);
   
    plot(x, y_int, 'DisplayName', ['k=' num2str(k)], 'LineWidth', 1.25);
    hold on;
end
legend('show');
title('n+2 węzłów aproksymacji');
xlabel('x');
ylabel('y');

% ------------------------------------------------------ 
%                   dla k = 2n
% ------------------------------------------------------ 
subplot(1,3,2);
plot(x, fx, 'DisplayName', ['f(x)'], 'LineWidth', 2);
hold on;
for i = n
    k = 2*i;
    xi = linspace(-1, 1, k);
    yi = f(xi);
    p = polyfit(xi, yi, i-1);
    y_int = polyval(p,x);
    plot(x, y_int, 'DisplayName', ['k=' num2str(k)], 'LineWidth', 1.25);
    hold on;
end
legend('show');
title('2n węzłów aproksymacji');
xlabel('x');
ylabel('y');

% ------------------------------------------------------ 
%                   dla k = 3n
% ------------------------------------------------------ 
subplot(1,3,3);
plot(x, fx, 'DisplayName', ['f(x)'], 'LineWidth', 2);
hold on;
for i = n
    k = 3*i;
    xi = linspace(-1, 1, k);
    yi = f(xi);
    p = polyfit(xi, yi, i-1);
    y_int = polyval(p,x);
    plot(x, y_int, 'DisplayName', ['k=' num2str(k)], 'LineWidth', 1.25);
    hold on;
end
legend('show');
title('3n  węzłów aproksymacji');
xlabel('x');
ylabel('y');