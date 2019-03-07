%==========================================================================
%                             RECTIFY IMAGES
%
%   This script is responsible to apply a rectification method in the input
% images, in order to allows the disparity map calculation.
%==========================================================================

function [lSnap, rSnap, tL, tR] = rectifyImages(lPts, rPts, F, lSnap, rSnap)

%   Estimates the projective transformations for the calibration.
[tL, tR] = estimateUncalibratedRectification(F, lPts.Location, ...
                                             rPts.Location, size(rSnap));
tformL = projective2d(tL);
tformR = projective2d(tR);

%   Applies the projective transformations on the input images.
lSnap = imwarp(lSnap, tformL, 'OutputView', imref2d(size(lSnap)));
rSnap = imwarp(rSnap, tformR, 'OutputView', imref2d(size(rSnap)));

%   Ends the script.
end