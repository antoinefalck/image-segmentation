clear all
close all
clc

% Definition des variables
p10 = 0.5;
p20 = 1 - p10;

% Signal X
X = signal3;
n = length(X);

% Recuperation des classes
X = uint8(X);
[counts, inutile] = imhist(X);
classe = find(counts) - 1;
X = double(X);
cl1 = classe(1);
cl2 = classe(2);

% Matrice de transisition
A = calc_transit_prio2(X, n, cl1, cl2);

% Definition du bruit
m1 = 127;
m2 = 128;
sig1 = 2;
sig2 = 3;

% Taux d'erreur
T = 100;
somme = 0;
for i=1:T
    Y = bruit_gauss2(X, cl1, cl2, m1, sig1, m2, sig2);
    Mat_f = gauss2(Y, n, m1, sig1, m2, sig2);
    X_apost = MPM_chaines2(Mat_f, n, cl1, cl2, A, p10, p20);
    
    somme = somme + taux_erreur(X, X_apost);
end
taux_erreur_MPM = somme / T