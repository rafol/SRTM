close all;
%Bilateral Scale Space Demo
% im = imread('bloodv.png');
% im = imread('celltest3.png'); 
im = imread('C:/Users/rafol/Dropbox/Artigo SIBIGRAP/Imagens/texture/eagle.tif'); 
im = double(im);
figure, imshow(im/255)
%%
%lambda=amount of detail suppression per scale
%iter=number of iterations
%quadmode = (0 = no quad fit, 1 = quad fit prior to scale, 2 = quad fit after scale)
data = im;
lambda = 10;
iter = 5;
quadmode = 2;
output2 = BiSS_q( im, lambda , iter, quadmode);

close all;
%Original
figure,imshow(im./255);
% figure,imshow(output(:,:,3)./255);
% figure,imshow(output2(:,:,3)./255);
figure,imshow(output2(:,:,iter)./255);



