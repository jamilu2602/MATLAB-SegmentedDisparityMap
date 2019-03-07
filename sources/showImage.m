%==========================================================================
%               EXIBIÇÃO DE UMA IMAGEM CAPTURADA PELO SISTEMA
%
%   Script responsável por representar uma das imagens do sistema de visão
% estéreo na tela.
%==========================================================================

function showImage(image)

%	Cria uma nova figura.
figure;

%	Exibe uma das imagens do sistema de visão estéreo.
imshow(image);
title('Original Image (Left)');

end