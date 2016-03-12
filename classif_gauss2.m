function S = classif_gauss2(Y, cl1, cl2, m1, sig1, m2, sig2)
    Max = max(normpdf(Y, m1, sig1), normpdf(Y, m2, sig2));
    S = cl1 * (normpdf(Y, m1, sig1) == Max) + cl2 * (normpdf(Y, m2, sig2) == Max);
end