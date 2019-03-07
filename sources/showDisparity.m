%==========================================================================
%                            SHOW DISPARITY
%
%   This script just shows the disparity map on the screen.
%==========================================================================

function showDisparity(dMap, dRng, label, colored)

%	Creates a new figure.
figure;

%	Shows the disparity map.
if colored == 1
    
    theAxs = axes;
    
    imshow(dMap, dRng, 'Parent', theAxs);
    
    colormap(theAxs, jet);
    colorbar;
    
else
    
    imshow(dMap, dRng);

end

title(label);

%   Ends the script.
end