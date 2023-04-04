% -----------------------------------------------------------------
%                    mac_2 (sor w zaleznosci od omega)
% -----------------------------------------------------------------
clear;
clf;

[A,b] = mac_2;

for w = 1.01:0.01:1.9
    [x_sor, it_sor] = sor(A,b,w);
    plot(w,it_sor, '*r');
    hold on;
end

xlabel('omega');
ylabel('liczba iteracji');
title('SOR dla danych mac\_2');