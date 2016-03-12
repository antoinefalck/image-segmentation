function Y = bruit_gauss2(X, cl1, cl2, m1, sig1, m2, sig2)
    Y = (m1 + sig1 * randn(1, length(X))) .* (X == cl1) + (m2 + sig2 * randn(1, length(X))) .* (X == cl2);
end