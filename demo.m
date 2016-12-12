% ===========================================================================
% Multi-scale Stochastic Regional Texture Merge Segmentation v_1.0 (2015-06-23)
% ===========================================================================
% 
% Written by 
% Rafael Sachett Medeiros <rsmedeiros@inf.ufrgs.br>
% Jacob Scharcanski		  <jacobs@inf.ufrgs.br>
% Alexander Wong		  <a28wong@uwaterloo.ca>
% 
% See README.txt for details.

addpath('auxlib');
addpath('BiSS');
addpath('STRlib');
addpath('SRMlib');

% input image filepath
path = './Images/test/';
% groundtruths image filepath
pg   = './Images/gt/';
% output image filepath
pd   = './Images/output/';

mkdir(pd);
arqs = dir([path '*.jpg']);

% Paramenter definitions
w = 2;       % window radio
clNum = 50;  % dictionary size
rpNum = 10;  % random projection size
Q = 400;     % regularization term
wg = [2 1.0 1.0]; % L*a*b* weigths
Blevels = 3; % Numer of BiSS levels

for imgIndex=1:length(arqs)
    % load images
    name = arqs(imgIndex).name; 
    im = imread([path name]);
    % get segmentation map
    [ map ] = fnSTM(im, w, clNum, rpNum, Q, wg', Blevels);
    % save result
    im3 = segImage(im2double(im), map);
    imwrite(im3, [pd name(1:end-4) '_reg.tif']);
    [a,b,map2] = unique(map);
    map = reshape(map2, size(map));
    imwrite(uint16(map), [pd name(1:end-4), '_seg.pgm']);
end
fprintf('DONE!\n')