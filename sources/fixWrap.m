%==========================================================================
%                     CORREÇÃO DO MAPA DE DISPARIDADES
%
%   Script responsável por "corrigir" a posição do mapa de disparidades,
% utilizando as transformações projetivas obtidas na retificação (além do 
% mapa de didsparidades original) como parâmetros. Retorna o mapa já corri-
% gido.
%==========================================================================

function dMap = fixWrap(dMap, tL, tR)

%	Calcula a média entre as transformações projetivas obtidas na retifica-
% ção.
tM = (tL + tR)/2;

%   Calcula a inversa da transformada projetiva que foi obtida anteriormen-
% te.
tform = projective2d(tM);
tform = invert(tform);

%	Aplica a transformada obtida anteriormente ao mapa de disparidades ori-
% ginal, corrigindo sua posição.
dMap = imwarp(dMap, tform, 'OutputView', imref2d(size(dMap)));

end