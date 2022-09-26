function cim=SelectPixelsCentre(image, p)

I=imread(image);
[M N O]=size(I);

minx = floor((M-p*M)/2);
miny = floor((N-p*N)/2);
maxx= minx+ floor(p*M);
maxy= miny+ floor(p*N);

cim = I(minx:maxx,miny:maxy,:);
