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

% Generation de la chaîne de Markov et affichage graphique
X = genere_Chaine2(n, cl1, cl2, A, p10, p20);
plot(X, 'or');