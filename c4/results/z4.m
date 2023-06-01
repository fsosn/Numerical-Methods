f = @(x) -0.1*x.^3 + 50 + - 0.02*exp(x);
init_guess = -10;
tols = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12 1e-13 1e-14];
dxs = [1e-1 1e-2 1e-3 1e-4 1e-5];

it_array = zeros(1, numel(tols));

for j = 1:numel(dxs)
    subplot(3,2,j);
    for i=1:numel(tols)
        [root, it] = newton_raphson(f,tols(i),init_guess,dxs(j));
        it_array(i) = it;
    end
    bar(it_array)
    xticklabels(tols);
    xlabel("Allowable error");
    ylabel("Number of iterations");
    title(sprintf("dx = %.0e", dxs(j)));
end