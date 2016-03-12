function cl = tirage_classe2(p1, p2, cl1, cl2)
    alea = rand();
    if alea < p1
        cl = cl1;
    else
        cl = cl2;
    end
end