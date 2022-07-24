%% Segmentation function
function [S,HH,T,L]=segmentation(deconvImg)

% find histogram for decnvolved image
% Threshold intensity is calculted using otsu's method
% as bakground of original image is bright,for getting default segmented image we
% do image inversion to get S
HH=imhist(deconvImg);
L=length(HH);
T=round(otsuthresh(HH)*256);
S=1-imbinarize(deconvImg,T/L);

end
