%==========================================================================
%                             SEGMENT IMAGE
% 
%   This script is responsible for segments an image. The segmented image 
% is returned as a label.
%==========================================================================

function sImage = segmentImage(image, range)

%   Calculates the threshold.
thres = range(2) - range(1);

%   Creates a structuring element.
sElem = strel('disk', 20);

%   Erodes and reconstruct one of the original images.
iErod = imerode(image, sElem);
iErod = imreconstruct(iErod, image);

%   Dilates and reconstruct one of the original images.
iDlte = imdilate(iErod, sElem);
iRslt = imreconstruct(imcomplement(iDlte), imcomplement(iErod));
iRslt = imcomplement(iRslt);

%   Calculates the threshold and quantizes the image.
tQuant = multithresh(iRslt, thres);
sImage = imquantize(iRslt, tQuant);

%   Ends the script.
end