clear all
close all
clc

% Definition des variables
X = signal;
m1 = 127;
sig1 = 2;
m2 = 128;
sig2 = 3;

% Recuperation des valeurs des classes
X = uint8(X);
[counts, inutile] = imhist(X);
classe = find(counts) - 1;
X = double(X);
cl1 = classe(1);
cl2 = classe(2);

% Calcul de la loi de X
[p1, p2] = calc_probaprio2(X, cl1, cl2);

% Iteration pour les differents erreur_moyenne
T = 10000;
erreur_moyenne = zeros(1, T);
somme = 0;
    
% Calcul d'un membre du vecteur erreur_moyenne
for i=1:T
    % Bruitage de X
    Y = bruit_gauss2(X, cl1, cl2, m1, sig1, m2, sig2);
    % Segmentation de Y
    S = MAP_MPM2(Y, cl1, cl2, p1, p2, m1, sig1, m2, sig2);
        
    tau = taux_erreur(X, S);
    somme = somme + tau;
end

% Affichage de l'erreur moyenne au bout de T iterations
erreur_moyenne_T = somme / T