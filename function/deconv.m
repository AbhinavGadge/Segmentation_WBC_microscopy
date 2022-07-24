%% deconvolution fnction

function D= deconv(InputImg) 

% function deconv gives images of WBC stained and RBC stained in three planes
% Output D gives the matrix having that images in D(:,:,k) k=1:3
% default parameter settings. Supported image classes for InputImg 
% include uint8, uint16, int16, single, double.
% deconvMatrix is the matrix of Optical density with standard values for
% eosin and hematoxyline stains
% reshaping of D is done for multiplication with deconvMatrix

% set of standard values for optical density (stain vectors)
%(from research paper named "Quantification of histochemical staining by color deconvolution ")
% https://www.researchgate.net/publication/319879820

He_OD=[0.18;0.20;0.08];
Eo_OD=[0.01;0.13;0.01];
DAB_OD=[0.10;0.21;0.29];

% deconvolution matrix
decovnMatrix= [He_OD/norm(He_OD) Eo_OD/norm(Eo_OD) DAB_OD/norm(DAB_OD)]';
decovnMatrix= inv(decovnMatrix) ;

% for log operation image is converted to double, to eliminate log(0)error 1 is added
InputImg = double(InputImg)+1;
OD = -log(InputImg)+1;   %optical density

% stain deconvolution
D = reshape(OD,[],3) * decovnMatrix;
D = reshape(D, size(InputImg));

% normalizing the matrix (intensity between 0 and 1) 
for i=1:size(D,3)
    Pln = D(:,:,i);         
    D(:,:,i) = (D(:,:,i)-min(Pln(:)))/(max(Pln(:)-min(Pln(:))));
    D(:,:,i) = 1 - D(:,:,i);
end
% using morphological operation for refining the results
SE=[0,1,0;1,1,1;0,1,0];
    D=imclose(D,SE);
end