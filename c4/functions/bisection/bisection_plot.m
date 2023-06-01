function [root, i] = bisection_plot(f, a, b, tol)
    if f(a) * f(b) > 0
        error('f(a) and f(b) do not have opposite signs.')
    end

    i = 1;
    num_it = 1e6;
    r = 0;
    n = 2000;
    x = linspace(a,b,n);
    y = f(x);

    hold on
    plot(x, y, 'Color', 'r')
    xlabel('x')
    ylabel('y')
    title('Bisection method')
    grid on
    hold on
    line(xlim, [0 0], 'Color', 'k', 'LineStyle', '--')

    while i<=num_it
        p = a + (b-a)/2;
        plot(p, f(p), 'o')
        if f(p) == 0 || (b-a)/2 < tol
            r = p;
            break;
        end
        if f(a)*f(p)>0
            a = p;
        else
            b = p;
        end
        i = i+1;
        if i > num_it
        error("Method failed after %d iterations\n", num_it);
        end
    end
    root = r;
    plot(root,f(root), 'bo')
end