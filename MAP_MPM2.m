function S = MAP_MPM2(Y, cl1, cl2, p1, p2, m1, sig1, m2, sig2)
    probaY1 = normpdf(Y, m1, sig1);
    probaY2 = normpdf(Y, m2, sig2);
    S = cl1 * (p1 * probaY1 > p2 * probaY2) + cl2 * (p1 * probaY1 < p2 * probaY2);
end