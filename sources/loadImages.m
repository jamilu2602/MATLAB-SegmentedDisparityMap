%==========================================================================
%                               LOAD IMAGES
%
%   This script is responsible for load an image pair from a given database.
%==========================================================================

function [lSnap, rSnap, error] = loadImages(scene, type)

%	Loads the files from a directory.
pathL = strcat('../dataset/', scene, '/im0.', type);
pathR = strcat('../dataset/', scene, '/im1.', type);

%	Reads the images.
try 
    lSnap = imread(pathL, type);
    rSnap = imread(pathR, type);
catch
    error = 1;
    return;
end

%   Returns 0 (zero) if everything were fine, or 1 (one) otherwise.
error = 0;

%   Ends the script.
end