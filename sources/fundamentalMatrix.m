%==========================================================================
%                           FUNDAMENTAL MATRIX
%
%   This script is responsible for estimate the fundamental matrix. It uses
% the original corresponding points of the scene, and returns the fundamen-
% tal matrix, besides a new set of points, containing only the correspon-
% ding points that were matched by the estimated fundamental matrix.
%==========================================================================

function [lPts, rPts, F, error] = fundamentalMatrix(lPts, rPts)

%   Gets the number of initial correspondences.
[lines, ~] = size(lPts);

%	Choses the fundamental matrix metric based on the number of initial
% matches. If it's is 16...
if lines >= 16
    %   ...uses the Least Median of Squares (LMedS) metric. Else, if
    % it's less than sixteen, but greater than eight...
    error = 0;
    method = 'LMedS';

else
    if lines >= 8
        %   ...uses the M-estimator Sample Consensus (MSAC) metric. Else,
        % if it's less than eight...
        error = 0;
        method = 'MSAC';
    else
        %   ...it's not possible to estimate the fundamental matrix.
        error = 1;
        return;
    end
end

%   If the metric were chosen, estimates the fundamental matrix, using it.
if error == 0
    
    [F, inliers] = estimateFundamentalMatrix(lPts, rPts, 'Method', method);

    lPts = lPts(inliers, :);
    rPts = rPts(inliers, :);

else
    
    F = zeros(3);
    
    lPts = [0 0];
    rPts = [0 0];

end

%   Ends the script.
end