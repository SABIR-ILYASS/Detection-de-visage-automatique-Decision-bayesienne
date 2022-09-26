% TD Reconnaissance de Formes - Exercice 1
close all
clear all
% Compléter les informations manquantes
Max_x = 4;
Min_x = -4;
Pas = 0.01;
x= [Min_x:Pas:Max_x];
L = length(x);

% Considèrons que 2 classes sont modélisées par les densités de
% probabilité gaussiennes suivantes :
pxw1 = exp(-(x.*x))./sqrt(pi);
mu2 = 1;
sigma2 = sqrt(0.5); % ecart-type
pxw2 = exp(-(x-mu2).*(x-mu2)/(2*sigma2^2))./sqrt(2*pi*sigma2^2);

%% 1. 1er cas:  Pw1=Pw2=0,5
Pw1 = 0.5;
Pw2 = 1 - Pw1;

%  Tracés des densités de probabilités des 2 classes
figure(1)
hold on
plot(x,pxw1,'color','red')
plot(x,pxw2,'color','yellow')
title('Densités de probabilités des classes (1:rouge, 2:jaune)')

%  Ajouter sur le même graphique les probabilités a posteriori
pxw1Pw1 = pxw1*Pw1;
pxw2Pw2 = pxw2*Pw2;
px = pxw1Pw1 + pxw2Pw2; 
Pw1x = pxw1Pw1./px;
Pw2x = pxw2Pw2./px;

hold on;
plot(x, Pw1x, 'Color', 'black')
plot(x, Pw2x, 'Color', 'green')
plot(x, px, 'Color', 'blue'); title("densité des probabilités (pxw1: rouge, pxw2: jaune, pw1x: noir, pw2x: vert, px: bleu)");


% En déduire le seuil de classification optimale.
...





%% 2. Modification des valeurs de probabilité à priori
Pw1 = 9/10;
Pw2 = 1/10;

%  Tracés des densités de probabilités des 2 classes
figure(2) 
hold on
plot(x,pxw1,'color','red')
plot(x,pxw2,'color','yellow')
title('Densités de probabilités des classes (1:rouge, 2:jaune)')

%  Ajouter sur le même graphique les probabilités à posteriori
...
    
% Que devient le seuil optimal ? Pourquoi ?
...
    
% Prise en compte du numérateur uniquement
...

% Observations / commentaires : 
...

