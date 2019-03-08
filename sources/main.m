%==========================================================================
%                               MAIN SCRIPT
% 
%   This is the mains script of the project. It is necessary a stereo image 
% pair to make this script works.
%==========================================================================

function main

% =========================== STATIC VARIABLES ============================

%   Used to control the process of the disparity map generation.
GENERATE = 1;

%   Used to configure the utilized database (Middlebury or Minoru3D), the 
% choosen scene and the image format of the choosen database.
SCENE = 'Bicycle2';
TYPE  = 'png';

%   Defines the default size for the input images.
IMG_SIZE = [240 320];

%   Range of the possible values for the disparity. The difference between 
% both values must be multiple of 16 (sixteen).
DISP_RNG = [-6 10];

%   Maximum percentage of blank pixels inside the map. The lower this value,
% the better the map -- but lower values can increase the number of retries
% to generate a acceptable disparity map, slowing the process.
MAX_BLNK = 3.0;
INCRS_RT = 0.1;

% =========================== LOADING IMAGES ==============================

%   Load images from a directory (Tsukuba or Middlebury).
[lSnap, rSnap, error] = loadImages(SCENE, TYPE);        

%   Verifies if there are any errors while loading the images.
if error == 1
    fprintf('Cannot load the images. Check.');
    return;
end

% ============================ PRE-PROCESSING =============================

%   Does a pre-processing step.
[lSnap, rSnap] = preProcessing(lSnap, rSnap, IMG_SIZE);

% ======================== DISPARITY MAP GENERATION =======================
while GENERATE == 1

    %   Controls the process. If the generated disparity map is incorrect, 
    % restarts the process.
    GENERATE = 0;
    
    %   Tells the user that it's trying generating the disparity map.
	clc;
	fprintf('---> Generating the map.\n---> Current threshold: %.1f\n', MAX_BLNK);

    %   Extracts the matched features using the SURF algorithm and the Sum 
    % of Squared Differences. 
    [lPts, rPts] = extractMatchedFeatures(lSnap, rSnap);
    
    %   Estimates the fundamental matrix using LMedS ou MSAC, depending on 
    % the case.
    [lPts, rPts, F, error] = fundamentalMatrix(lPts, rPts);

    %   Verifies if the fundamental matrix was successfully generated. Two
    % cases are verified here: if the number of matches was enough (more
    % than seven) or if the fundamental matrix may produce distortions. 
    % In the first case, it's necessary to recapture the images; on second 
    % case, it's just necessary to recalculate the fundamental matrix. 
    if error == 1
        
        clc;
        fprintf('FAILED: low matched features.');
        
        return;

    end

    if isEpipoleInImage(F , size(lSnap)) == true || ...
       isEpipoleInImage(F', size(rSnap)) == true
        
        clc;
        fprintf('(Found epipolar lines. Retrying.)');
        
        GENERATE = 1;
        
        continue;    
    
    end
    
    %   Realizes the rectification step using the fundamental matrix.
    [lRect, rRect, tL, tR] = rectifyImages(lPts, rPts, F, lSnap, rSnap);

    %   Creates the disparity map.
    [dMap, dRng] = disparityMap(lRect, rRect, DISP_RNG);

    %   Fixes the map distortion, caused by the rectification step.
    dMap = fixWrap(dMap, tL, tR);

    %   Removes some parts of the disparity map that can be inconsiderate.
    dMap = removeGaps(dMap);

    %   Verifies if the obtained disparity map obey the max number of bad 
    % pixels (with null disparity). In positive case, another matrix needs 
    % to be obtained and the process must be redone. Otherwise, the initial 
    % disparity map is ready.
    if disparityFitness(dMap) > MAX_BLNK
        
        %   Generates the matrix again, increasing the threshold.
        MAX_BLNK = MAX_BLNK + INCRS_RT;
        GENERATE = 1;
        
        continue;
    
    end
                
    %   Shows the disparity map.
    showImage(rSnap, 'Original Image');
    showImage(dMap, 'Disparity Map', dRng);         

    %   Shows the fitness and the similarity with groundtruth.
    fprintf('---> DONE. Fitness: %.4f\n\n', disparityFitness(dMap));
    
end

% ========================== INPUT SEGMENTATION ===========================

%   Segments one of the the input images.
rSeg = segmentImage(rSnap, DISP_RNG);
rSeg = rgb2gray(label2rgb(rSeg));

%   Shows the segmented image.
showImage(rSeg, 'Segmented Image');

% TODO: use the segmented image to increase the disparity map quality.

% ================= COMBINING DISPARITY AND SEGMENTATION ==================

%   Ends the script.
end