%==========================================================================
%                         RETIFICA��O DAS IMAGENS
%
%   Script respons�vel por realizar a retifica��o das imagens originalmente 
% obtidas pelo sistema de vis�o est�reo, de modo a realizar a retifica��o 
% destas. Recebe tais imagens, seus pontos correspondentes e a matriz fun-
% damental que os associa como entrada; retorna as imagens retificadas, bem
% como as transforma��es projetivas utilizadas no processo.
%==========================================================================

function [lSnap, rSnap, tL, tR] = rectifyImages(lPts, rPts, F, lSnap, rSnap)

%   Estima as transforma��es projetivas para a retifica��o.
[tL, tR] = estimateUncalibratedRectification(F, lPts.Location, ...
                                             rPts.Location, size(rSnap));
tformL = projective2d(tL);
tformR = projective2d(tR);

%   Aplica as transforma��es projetivas nas imagens de entrada.
lSnap = imwarp(lSnap, tformL, 'OutputView', imref2d(size(lSnap)));
rSnap = imwarp(rSnap, tformR, 'OutputView', imref2d(size(rSnap)));

end