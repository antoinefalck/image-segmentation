function X_apost = MPM_chaines2(Mat_f, n, cl1, cl2, A, p10, p20)
    alpha = forward2(Mat_f, n, A, p10, p20);
    beta = backward2(Mat_f, n, A);
    gamma = alpha .* beta;
    
    X_apost = cl1 * (gamma(1, :) == max(gamma)) + cl2 * (gamma(2, :) == max(gamma));
end