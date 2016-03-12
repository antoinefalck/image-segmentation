function X = genere_Chaine2(n, cl1, cl2, A, p10, p20)
    % Initialisation
    X(1, 1) = tirage_classe2(p10, p20, cl1, cl2);
    
    % Recursion
    for i=2:n
        if X(1, i-1) == cl1
            X(1, i) = tirage_classe2(A(1, 1), A(1, 2), cl1, cl2);
        else
            X(1, i) = tirage_classe2(A(2, 1), A(2, 2), cl1, cl2);
        end
    end
end