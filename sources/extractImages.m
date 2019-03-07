%==========================================================================
%                           EXTRACT IMAGES
%
%   This script is responsible for the extraction of the images from a scene
% using a pair of webcams. It's necessary to set the ID of each camera (de-
% fined by the MatLab IDE).
%==========================================================================

function [lSnap, rSnap, error] = extractImages(LEFT_CAM, RGHT_CAM)

%   Initializes the pair of cameras. The cameras used here has only the YUY2
% format support. If it not your case, you'll need to comment the lines
% below with the 'ReturnedColorSpace' variable.
try 
    
    lCam = videoinput('winvideo', LEFT_CAM, 'YUY2_640x480');
    rCam = videoinput('winvideo', RGHT_CAM, 'YUY2_640x480');

    lCam.ReturnedColorSpace = 'rgb';
    rCam.ReturnedColorSpace = 'rgb';

catch
    error = 1;
    return;
end

%   Tries to captures the images using the cameras.
try
    lSnap = getsnapshot(lCam);
    rSnap = getsnapshot(rCam);
catch
    error = 2;
    return;
end

%   Saves the images (in order to add to a database later).
imwrite(lSnap, 'im0.png', 'png', 'BitDepth', 8);
imwrite(rSnap, 'im1.png', 'png', 'BitDepth', 8);

%   Clears the videoinput buffer from the memory.
delete(lCam);
delete(rCam);

clear('lCam');
clear('rCam');

%   Returns 0 (zero) if everything were fine, or 1 (one) otherwise.
error = 0;

%   Ends the script.
end