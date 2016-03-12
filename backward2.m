function beta = backward2(Mat_f, n, A)
    % Initialisation
    beta(1, n) = 1/2;
    beta(2, n) = 1/2;
    
    % Recursion
    for j=n-1:-1:1
        beta(1, j) = beta(1, j+1)*A(1, 1)*Mat_f(1, j+1) + beta(2, j+1)*A(1, 2)*Mat_f(2, j+1);
        beta(2, j) = beta(1, j+1)*A(2, 1)*Mat_f(1, j+1) + beta(2, j+1)*A(2, 2)*Mat_f(2, j+1);
        
        S = beta(1, j) + beta(2, j);
        
        % Rescaling
        beta(1, j) = beta(1, j) / S;
        beta(2, j) = beta(2, j) / S;
    end
end