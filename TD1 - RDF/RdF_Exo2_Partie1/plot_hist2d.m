%Objectif: représentation de l'histogramme 2D des caractéristiques (espace
%2D des paramètres)
function plot_hist2d(cr, cb)
%creation d'une matrice 256 x 256 de zéros pour initialisation d'une
%matrice quantifiée 
hist2d = zeros(256);
%approximation entière des valeurs de chrominance
cr = round(cr);
cb = round(cb);
%calcul de l'histogramme 2D 
for i = 1:length(cr)
   hist2d(cr(i),cb(i)) = hist2d(cr(i),cb(i))+1;
end
% %représentation 2D de l'histogramme
surf(hist2d)
