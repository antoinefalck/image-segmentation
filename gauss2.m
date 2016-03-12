function Mat_f = gauss2(Y, n, m1, sig1, m2, sig2)
    Mat_f(1, :) = normpdf(Y, m1, sig1);
    Mat_f(2, :) = normpdf(Y, m2, sig2);
end