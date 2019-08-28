my_fun = @(x) x.*log(x)-1;
low = 1;
high = 2;
tolerance = .00001;
x = NM_regulafalsi(my_fun, low, high, tolerance);