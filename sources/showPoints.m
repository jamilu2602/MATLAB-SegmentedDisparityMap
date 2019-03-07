%==========================================================================
%                              SHOW MATCHES
%
%   This script is responsible for shows the corresponding points between
% a pair of stereo images.
%==========================================================================

function showPoints(lSnap, rSnap, lPts, rPts, label)

%	Creates a new figure.
figure;
ax = axes;

%	Shows the matches between corresponding points.
showMatchedFeatures(lSnap, rSnap, lPts, rPts, 'montage', 'Parent', ax);
title(ax, label);
legend(ax, 'Left Points', 'Right Points');

end