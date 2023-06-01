function value = derivative(f, x, dx)
    f1 = f(x+dx);
    f2 = f(x-dx);
    value = (f1 - f2)/(2*dx);
end


