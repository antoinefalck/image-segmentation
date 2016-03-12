clear all
close all
clc

% Definition des probabilites
p10 = 0.5;
p20 = 1 - p10;

% Recuperation du signal X
[X, m] = Im2chaine('cible2.bmp');

n = m * m;

% Recuperation des classes
X = uint8(X);
[counts, inutile] = imhist(X);
classe = find(counts) - 1;
X = double(X);
cl1 = classe(1);
cl2 = classe(2);

% Definition du bruit
m1 = cl1;
m2 = cl2;
sig1 = 100;
sig2 = 100;

% Bruitage du signal
Y = bruit_gauss2(X, cl1, cl2, m1, sig1, m2, sig2);

T = 1000;
somme_1 = 0;
somme_bay = 0;
somme_apost = 0;
for i=1:T
    % Bruitage du signal
    Y = bruit_gauss2(X, cl1, cl2, m1, sig1, m2, sig2);
    
    % Segmentation du signal par la premiere methode
    X_1 = classif_gauss2(Y, cl1, cl2, m1, sig1, m2, sig2);

    % Segmentation du signal par methode bayesienne
    [p1, p2] = calc_probaprio2(X, cl1, cl2);
    X_bay = MAP_MPM2(Y, cl1, cl2, p1, p2, m1, sig1, m2, sig2);

    % Segmentation du signal par methode MPM
    A = calc_transit_prio2(X, n, cl1, cl2);
    Mat_f = gauss2(Y, n, m1, sig1, m2, sig2);
    X_apost = MPM_chaines2(Mat_f, n, cl1, cl2, A, p10, p20);
    
    somme_1 = somme_1 + taux_erreur(X, X_1);
    somme_bay = somme_bay + taux_erreur(X, X_bay);
    somme_apost = somme_apost + taux_erreur(X, X_apost);
end

erreur_1 = somme_1 / T
erreur_bay = somme_bay / T
erreur_apost = somme_apost / T