clear all
close all
clc

% Definition des variables
cl1 = 1;
cl2 = 0;
p10 = 0.5;
p20 = 1 - p10;
A(1, 1) = 0.9;
A(1, 2) = 1 - A(1, 1);
A(2, 2) = 0.3;
A(2, 1) = 1 - A(2, 2);
n = 20;
m1 = 127;
m2 = 128;
sig1 = 2;
sig2 = 3;

% Taux d'erreur
T = 100000;
somme = 0;
for i=1:T
    X = genere_Chaine2(n, cl1, cl2, A, p10, p20);
    Y = bruit_gauss2(X, cl1, cl2, m1, sig1, m2, sig2);
    Mat_f = gauss2(Y, n, m1, sig1, m2, sig2);
    X_apost = MPM_chaines2(Mat_f, n, cl1, cl2, A, p10, p20);
    
    somme = somme + taux_erreur(X, X_apost);
end
taux_erreur_MPM = somme / T