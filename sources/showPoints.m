%==========================================================================
%                EXIBIÇÃO DAS CORRESPONDÊNCIAS ENTRE IMAGENS
%
%   Script responsável por representar as correspondências presentes entre
% cantos de um par de imagens estéreo.
%==========================================================================

function showPoints(lSnap, rSnap, lPts, rPts, label)

%	Cria uma nova figura.
figure;
ax = axes;

%	Exibe as correspondências na tela. As imagens do sistema saem lado a
% lado, com linhas amarelas ligando as correspondências entre elas.
showMatchedFeatures(lSnap, rSnap, lPts, rPts, 'montage', 'Parent', ax);
title(ax, label);
legend(ax, 'Left Points', 'Right Points');

end