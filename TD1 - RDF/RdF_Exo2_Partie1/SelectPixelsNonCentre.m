function cim=SelectPixelsNonCentre(cb,cr,p)

[M N]=size(cb);

minx = floor((M-p*M)/2);
miny = floor((N-p*N)/2);
maxx= minx+ floor(p*M);
maxy= miny+ floor(p*N);

n_sup = (maxy-miny+1)*(maxx-minx+1);
cim = zeros(M*N-n_sup,2);

index = 1;
for x = 1:M
    for y = 1:N
        if(x < minx)
            cim(index,1) = cb(x,y);
            cim(index,2) = cr(x,y);
            index = index + 1;
        elseif(x > maxx)
            cim(index,1) = cb(x,y);
            cim(index,2) = cr(x,y);
            index = index + 1;
        else
            if(y < miny)
                cim(index,1) = cb(x,y);
                cim(index,2) = cr(x,y);
                index = index + 1;
            end
            if(y > maxy)
                cim(index,1) = cb(x,y);
                cim(index,2) = cr(x,y);
                index = index + 1;
            end
        end
    end
end




