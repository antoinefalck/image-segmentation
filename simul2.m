function X = simul2(n, cl1, cl2, p1, p2)
    A = rand(1, n);
    P1 = p1 * ones(1, n);
    X = cl1 * (A < P1) + cl2 * (A > P1);
end