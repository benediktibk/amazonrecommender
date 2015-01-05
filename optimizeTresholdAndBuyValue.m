f = @(x) (-1)*precisionCalculation(x(1), x(2));
treshold = fminsearch(f, [2, 1.1]);
display(treshold);