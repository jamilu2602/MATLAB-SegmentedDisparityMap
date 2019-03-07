%==========================================================================
%                     CORRE��O DO MAPA DE DISPARIDADES
%
%   Script respons�vel por "corrigir" a posi��o do mapa de disparidades,
% utilizando as transforma��es projetivas obtidas na retifica��o (al�m do 
% mapa de didsparidades original) como par�metros. Retorna o mapa j� corri-
% gido.
%==========================================================================

function dMap = fixWrap(dMap, tL, tR)

%	Calcula a m�dia entre as transforma��es projetivas obtidas na retifica-
% ��o.
tM = (tL + tR)/2;

%   Calcula a inversa da transformada projetiva que foi obtida anteriormen-
% te.
tform = projective2d(tM);
tform = invert(tform);

%	Aplica a transformada obtida anteriormente ao mapa de disparidades ori-
% ginal, corrigindo sua posi��o.
dMap = imwarp(dMap, tform, 'OutputView', imref2d(size(dMap)));

end