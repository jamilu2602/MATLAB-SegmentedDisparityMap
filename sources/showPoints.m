%==========================================================================
%                EXIBI��O DAS CORRESPOND�NCIAS ENTRE IMAGENS
%
%   Script respons�vel por representar as correspond�ncias presentes entre
% cantos de um par de imagens est�reo.
%==========================================================================

function showPoints(lSnap, rSnap, lPts, rPts, label)

%	Cria uma nova figura.
figure;
ax = axes;

%	Exibe as correspond�ncias na tela. As imagens do sistema saem lado a
% lado, com linhas amarelas ligando as correspond�ncias entre elas.
showMatchedFeatures(lSnap, rSnap, lPts, rPts, 'montage', 'Parent', ax);
title(ax, label);
legend(ax, 'Left Points', 'Right Points');

end