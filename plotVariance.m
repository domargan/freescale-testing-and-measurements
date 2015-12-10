function plotvariance(Xs, media, desv)

gris = [media+desv;flipdim(media-desv,1)];
fill([Xs; flipdim(Xs,1)], gris, [6 6 6]/8, 'EdgeColor', [6 6 6]/8);