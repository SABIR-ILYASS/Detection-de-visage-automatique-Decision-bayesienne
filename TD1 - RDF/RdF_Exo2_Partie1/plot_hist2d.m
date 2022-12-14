%Objectif: repr?sentation de l'histogramme 2D des caract?ristiques (espace
%2D des param?tres)
function plot_hist2d(cr, cb)
%creation d'une matrice 256 x 256 de z?ros pour initialisation d'une
%matrice quantifi?e 
hist2d = zeros(256);
%approximation enti?re des valeurs de chrominance
cr = round(cr);
cb = round(cb);
%calcul de l'histogramme 2D 
for i = 1:length(cr)
   hist2d(cr(i),cb(i)) = hist2d(cr(i),cb(i))+1;
end
% %repr?sentation 2D de l'histogramme
surf(hist2d)
