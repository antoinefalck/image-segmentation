function [p1, p2] = calc_probaprio2(X, cl1, cl2)
    N = length(X);
    nbp1 = sum((X==cl1));
    p1 = nbp1 / N;
    p2 = 1 - p1;
end