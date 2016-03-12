function tau = taux_erreur(A, B)
    C = (A == B);
    n = length(A);
    tau = 1 - sum(C) / n;
    if tau > 0.5
        tau = 1 - tau;
    end
end