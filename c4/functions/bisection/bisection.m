function [root, i] = bisection(f, a, b, tol)
    if f(a) * f(b) > 0
        error('f(a) and f(b) do not have opposite signs.')
    end
    
    i = 1;
    n = 1e6;
    r = 0;

    while i<=n
        p = a + (b-a)/2;
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
        if i > n
        error("Method failed after %d iterations\n", n);
        end
    end
    root = r;
end