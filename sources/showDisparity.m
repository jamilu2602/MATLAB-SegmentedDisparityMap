%==========================================================================
%                            SHOW DISPARITY
%
%   This script just shows the disparity map on the screen.
%==========================================================================

function showDisparity(dMap, dRng, label)

%	Creates a new figure.
figure;
theAxs = axes;

%	Shows the disparity map.
imshow(dMap, dRng, 'Parent', theAxs);
colormap(theAxs, jet);
colorbar;
title(label);

end