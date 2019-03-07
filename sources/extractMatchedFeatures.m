%==========================================================================
%                        EXTRACTING MATCHED FEATURES
%
%   This script is responsible for extracting matching points between images. 
% Receives a pair of stereo images as a parameter, and returns the matching
% points between them.
%==========================================================================

function [lPts, rPts] = extractMatchedFeatures(lSnap, rSnap)

%   Detects the corners of each image using the corner detection algorithm.
% The Min8Val algorithm had the best results in a previous analysis.
surfL = detectMinEigenFeatures(lSnap);
surfR = detectMinEigenFeatures(rSnap);

%   Calculates the matches between the obtained corners of each image, using
% the Sum of Squared Differences (SSD).
[ftrsL, vldPtsL] = extractFeatures(lSnap, surfL);
[ftrsR, vldPtsR] = extractFeatures(rSnap, surfR);

index = matchFeatures(ftrsL, ftrsR, 'Unique', true);

lPts = vldPtsL(index(:,1),:);
rPts = vldPtsR(index(:,2),:);

end