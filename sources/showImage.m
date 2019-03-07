%==========================================================================
%                               SHOW IMAGE
%
%   This script just shows one of the stereo images on the screen.
%==========================================================================

function showImage(image)

%	Creates a new figure.
figure;

%	Shows the original image.
imshow(image);
title('Original Image (Left)');

end