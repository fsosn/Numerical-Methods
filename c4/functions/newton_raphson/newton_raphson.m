function [root, i] = newton_raphson(f, tol, init_guess, dx)
    i = 0;
    num_it = 1e6;
    r = 0;
    po = init_guess;
    dpo = dx;

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
end