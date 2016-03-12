function alpha = forward2(Mat_f, n, A, p10, p20)
    % Initialisation
    alpha(1, 1) = p10 * Mat_f(1, 1); 
    alpha(2, 1) = p20 * Mat_f(2, 1);
    
    % Recursion
    for j=2:n
        alpha(1, j) = (alpha(1, j-1)*A(1, 1) + alpha(2, j-1)*A(2, 1)) * Mat_f(1, j);
        alpha(2, j) = (alpha(1, j-1)*A(1, 2) + alpha(2, j-1)*A(2, 2)) * Mat_f(2, j);
        
        S = alpha(1, j) + alpha(2, j);
        
        alpha(1, j) = alpha(1, j) / S;
        alpha(2, j) = alpha(2, j) / S;
    end
end