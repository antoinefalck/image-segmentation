clear all
close all
clc

% Definition des variables
cl1 = 1;
cl2 = 0;
p10 = 0.2;
p20 = 1 - p10;
A(1, 1) = 0.9;
A(1, 2) = 1 - A(1, 1);
A(2, 2) = 0.9;
A(2, 1) = 1 - A(2, 2);
n = 50;
m1 = cl1;
m2 = cl2;
sig1 = 0.1;
sig2 = 0.2;

% Generation de la chaîne de Markov et du bruit
X = genere_Chaine2(n, cl1, cl2, A, p10, p20);
Y = bruit_gauss2(X, cl1, cl2, m1, sig1, m2, sig2);

% Affichage graphique
hold on
plot(X, 'or');
plot(Y);