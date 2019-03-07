%==========================================================================
%                             DISPARITY MAP
%
%   This script is responsible for the calculation of the disparity map. It
% returns the produced disparity map (using the SemiGlobal matching method)
% and the range of the values that was used to generate the disparity map. 
% Reference:
%
% HIRSCHMULLER, H., 2005. Accurate and Efficient Stereo Processing by Semi-
% Global Matching and Mutual Information. Proc. of Int. Conference on Com-
% puter Vision and Pattern Recognition, v. 2, p. 807-814, 2005.
%==========================================================================

function [dispMap, dispRng] = disparityMap(lSnap, rSnap, dispRng)

%   Applies the disparity map function.
dispMap = disparity(lSnap, rSnap, 'DisparityRange', dispRng);

end