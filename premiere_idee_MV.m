clear all
close all
clc

% Definition des variables
X = signal;
m1 = 100;
sig1 = 10;
m2 = 200;
sig2 = 50;

% Recuperation des valeurs des classes
X = uint8(X);
[counts, inutile] = imhist(X);
classe = find(counts) - 1;
X = double(X);
cl1 = classe(1);
cl2 = classe(2);

% Bruitage de X
Y = bruit_gauss2(X, cl1, cl2, m1, sig1, m2, sig2);

% Signal segmente
S = classif_gauss2(Y, cl1, cl2, m1, sig1, m2, sig2);

% Graphique
%hold all
%plot(X, 'or');
%plot(Y);
%plot(S, 'xg');

% Taux d'erreur
tau = taux_erreur(X, S);

% Iteration pour les differents erreur_moyenne
T = 1000;
erreur_moyenne = zeros(1, T);
for N=1:T
    somme = 0;
    % Calcul d'un membre du vecteur erreur_moyenne
    for i=1:N
        Y = bruit_gauss2(X, cl1, cl2, m1, sig1, m2, sig2);
        S = classif_gauss2(Y, cl1, cl2, m1, sig1, m2, sig2);
        tau = taux_erreur(X, S);
        somme = somme + tau;
    end
    erreur_moyenne(1, i) = somme / N;
end

% Affichage de l'erreur moyenne au bout de T iterations
erreur_moyenne_T = erreur_moyenne(1, T)
% Evolution au cours des iterations
plot(erreur_moyenne)