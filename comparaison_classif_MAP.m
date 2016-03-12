clear all
close all
clc

% Definition des variables
cl1 = 100;
cl2 = 200;
m1 = 127;
sig1 = 2;
m2 = 128;
sig2 = 3;
p1 = 0.125;
p2 = 1 - p1;
n = 20;

% Simulation de X
X = simul2(n, cl1, cl2, p1, p2);

% Iteration pour les differents erreur_moyenne
T = 100000;
somme_moyenne_classif = 0;
somme_moyenne_MAP_MPM = 0;

for i=1:T
    % Bruitage de X
    Y = bruit_gauss2(X, cl1, cl2, m1, sig1, m2, sig2);
    
    % Segementation de Y
    S_classif = classif_gauss2(Y, cl1, cl2, m1, sig1, m2, sig2);
    S_MAP_MPM = MAP_MPM2(Y, cl1, cl2, p1, p2, m1, sig1, m2, sig2);
    
    % Calcul erreur cumulee
    somme_moyenne_classif = somme_moyenne_classif + taux_erreur(X, S_classif);
    somme_moyenne_MAP_MPM = somme_moyenne_MAP_MPM + taux_erreur(X, S_MAP_MPM);
end

% Retour erreurs
%erreur_moyenne_classif = somme_moyenne_classif / T
erreur_moyenne_MAP_MPM = somme_moyenne_MAP_MPM / T