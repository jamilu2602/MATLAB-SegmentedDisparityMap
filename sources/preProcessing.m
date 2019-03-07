%==========================================================================
%                              PRE-PROCESSING
%
%   This script is responsible for the pre-processing (for now, just an
% greyscale conversion and resizing) for each stereo image.
%
%   (Maybe I'll try new concepts in the future, so stay alert!)
%==========================================================================

function [lSnap, rSnap] = preProcessing(lSnap, rSnap)

%	Greyscale conversion (if needed).
if size(lSnap, 3) == 3
    lSnap = rgb2gray(lSnap);
    rSnap = rgb2gray(rSnap);
end

%   Increases the image intensity (contrast) of each images.
lSnap = imadjust(lSnap);
rSnap = imadjust(rSnap);

%   Increases the sharpness of each images.
lSnap = imsharpen(lSnap);
rSnap = imsharpen(rSnap);

%   Resizes the images.
lSnap = imresize(lSnap, [240 320]);
rSnap = imresize(rSnap, [240 320]);

%   Ends the script.
end