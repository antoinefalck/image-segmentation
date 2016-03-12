% affiche une chaine transformée en image 

function chaine2Im(X,taille);

[a,b]=peano(taille);

for i=1:taille*taille  
      Xi(a(i),b(i))=X(i);        
end;

    figure
    Xi=double(Xi);
    imagesc(Xi);
    axis image
    axis off
    colormap(gray);
    %inutile=0.0;
