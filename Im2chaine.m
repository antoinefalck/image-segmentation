function [X,m]=Im2chaine(nom_image)

[Xr]=imread(nom_image,'BMP');
[m,n]=size(Xr);

[a,b]=peano(m);

for i=1:m
    for j=1:m
        X(j+(i-1)*m)=Xr(a(j+(i-1)*m),b(j+(i-1)*m));
    end
end