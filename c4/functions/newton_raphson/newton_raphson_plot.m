function [root, i] = newton_raphson_plot(f, a, b, tol, init_guess, dx)
    i = 0;
    num_it = 1e6;
    r = 0;
    po = init_guess;
    dpo = dx;
    n = 2000;
    x = linspace(a,b,n);
    y = f(x);

    hold on
    plot(x, y, 'Color', 'r')
    xlabel('x')
    ylabel('y')
    title('Newton-Raphson method')
    grid on
    line(xlim, [0 0], 'Color', 'k', 'LineStyle', '--')

    while i<=num_it
        p = po - f(po)/derivative(f,po, dpo);
        if abs(p-po) < tol
            r = p;
            break;
        end
        po = p;
        i = i+1;
        if i > num_it
        error("Method failed after %d iterations\n", num_it);
        end
    end
    root = r;
    plot(root,f(root), 'bo')
    legend("Given function", "Found root");
end