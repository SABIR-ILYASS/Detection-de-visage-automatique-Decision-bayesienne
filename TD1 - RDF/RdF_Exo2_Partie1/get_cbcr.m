%Objectif de la fonction : extraire les composantes chromatiques d'une
%image d'entrée
function [cb, cr] = get_cbcr(im)
% appel de la fonction de conversion de Matlab  RGB to YCbCr
imycc = rgb2ycbcr(im);
% filtrage passe bas de chaque plan couleur 
% définition du filtre
lpf = 1/9 * ones(3);
% extraction des 2 composantes chromatiques 
cb = imycc(:,:,2);
cr = imycc(:,:,3);
% filtrage 
cb = filter2(lpf, cb);
cr = filter2(lpf, cr);
