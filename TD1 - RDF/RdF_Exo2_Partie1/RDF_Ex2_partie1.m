%% Partie 1 
clear all;
close all;

%% Apprentissage d'un modèle de peau
database_dir='George_W_Bush';

fnames = dir(fullfile(database_dir, '*.jpg'));
num_files = size(fnames,1);
p=0.2 ; 

% Image de test
%inputfile='George_W_Bush/George_W_Bush_0024.jpg';
inputfile='George_W_Bush/George_W_Bush_0027.jpg';
I_test=imread(inputfile);

figure;imshow(I_test);
imycbcr = rgb2ycbcr(I_test);

all_data=[];
for f = 1:20  %num_files to learn from all images
   im=strcat(database_dir,'/',fnames(f).name) ;  
   % extraction d'une zone centrale de l'image 
   cim=SelectPixelsCentre(im, p);
   % sortie : cim : composé de 3 matrices correspondant aux 3 plans couleurs 
   % r=cim(:,:,1), g=cim(:,:,2), b=cim(:,:,3)
   subplot(4,5,f)
   imagesc(cim)
   
   % extraction des composantes chromatiques cb, cr de la zone précédemment extraite
   [cb, cr] = get_cbcr(cim);
   cb_data=reshape(cb,[size(cb,1)*size(cb,2),1]);
   cr_data=reshape(cr,[size(cr,1)*size(cr,2),1]);
   crcb_data=[cr_data cb_data];
   clear cb; clear cr; clear cb_data; clear cr_data;
   % on obtient un vecteur de taille size(cim,1)*size(cim,2) lignes * 2
   % colonnes (col1 = cr; col2 = cb) 
   % chaque ligne de la matrice correspond à un pixel (un échantillon/individu de type
   % peau) caractérisé par 2 valeurs cr, cb filtrées.   
   all_data=[all_data;crcb_data];    
  % figure;imshow(cim);
end 

%% Représentation des échantillons dans l'espace des paramètres
figure;
plot_hist2d(all_data(:,1), all_data(:,2));
% interprétation de l'histogramme


%% Modélisation des données par une gaussienne
%estimation des paramètres statistiques du modèle à partir des échantillons
% mu1 = ...
% C1 =...
% C1_inv = ...;
% dC1 = ...;
% %calcul du modèle dans un plan 2D
% modelegaussien = zeros(256);
% for r = 0:255
%    for b = 0:255
% 	 x = [r; b];
%       % calcul de la vraisemblance de chaque pixel
%       modelegaussien(r+1,b+1) = GaussLikelihood(x, ...);%likelihood=vraisemblance
%    end
% end
% %représentation de l'histogramme 2D 
% subplot(1,2,1);
% plot_hist2d(all_data(:,1), all_data(:,2))
% title('Histogramme 2D des échantillons')
% %représentation du modèle obtenu à partir de l'histogramme 2D
% subplot(1,2,2);
% surf(modelegaussien);
% title('Modèle de la densité de probabilité jointe gaussienne de la classe peau')

%Interprétation des résultats


%% Application du modèle à des images test

% [m,n,l] = size(I_test);
% %initialisation d'une matrice 2D de la taille de l'image à traiter
% pxskin = zeros(m,n);
% for i = 1:m
%    for j = 1:n
%       %extraction des caractéristiques d'un échantillon (=pixel)
%        cr = double(imycbcr(i,j,3));
%        cb = double(imycbcr(i,j,2));
%        x=[cr; cb];
%        % calcul de la vraisemblance de chaque pixel
%        pxskin(i,j)=GaussLikelihood(x,...);
%    end
% end
% 
% %filtrage moyen pour lisser les valeurs 
% lpf= 1/9*ones(3);
% pxskin = filter2(lpf,pxskin);
% %normalisation des valeurs de vraisemblance par la valeur max
% pxskin = pxskin./max(max(pxskin));

% %affichage de l'image résultat
% figure;
% subplot(1,2,1);
% imshow(I_test, [0 1]);
% title('Image RGB initiale')
% subplot(1,2,2);
% imshow(pxskin, [0 1]);
% title('Image p(x/skin)')
% 
% 
