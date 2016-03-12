function A = calc_transit_prio2(X, n, cl1, cl2)
    couple_1_1 = 0;
    couple_1_2 = 0;
    couple_2_1 = 0;
    couple_2_2 = 0;
    
    for i=1:n-1
        if X(1, i) == X(1, i+1)
            if X(1, i) == cl1;
                couple_1_1 = couple_1_1 + 1;
            else
                couple_2_2 = couple_2_2 + 1;
            end
        else
            if X(1, i) == cl1;
                couple_1_2 = couple_1_2 + 1;
            else
                couple_2_1 = couple_2_1 + 1;
            end
        end
    end
    
    A(1, 1) = couple_1_1 / (n-1);
    A(1, 2) = couple_1_2 / (n-1);
    A(2, 1) = couple_2_1 / (n-1);
    A(2, 2) = couple_2_2 / (n-1);
end