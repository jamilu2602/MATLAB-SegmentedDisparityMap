%==========================================================================
%                         RETIFICAÇÃO DAS IMAGENS
%
%   Script responsável por realizar a retificação das imagens originalmente 
% obtidas pelo sistema de visão estéreo, de modo a realizar a retificação 
% destas. Recebe tais imagens, seus pontos correspondentes e a matriz fun-
% damental que os associa como entrada; retorna as imagens retificadas, bem
% como as transformações projetivas utilizadas no processo.
%==========================================================================

function [lSnap, rSnap, tL, tR] = rectifyImages(lPts, rPts, F, lSnap, rSnap)

%   Estima as transformações projetivas para a retificação.
[tL, tR] = estimateUncalibratedRectification(F, lPts.Location, ...
                                             rPts.Location, size(rSnap));
tformL = projective2d(tL);
tformR = projective2d(tR);

%   Aplica as transformações projetivas nas imagens de entrada.
lSnap = imwarp(lSnap, tformL, 'OutputView', imref2d(size(lSnap)));
rSnap = imwarp(rSnap, tformR, 'OutputView', imref2d(size(rSnap)));

end