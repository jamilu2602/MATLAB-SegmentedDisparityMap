%==========================================================================
%               EXIBI��O DE UMA IMAGEM CAPTURADA PELO SISTEMA
%
%   Script respons�vel por representar uma das imagens do sistema de vis�o
% est�reo na tela.
%==========================================================================

function showImage(image)

%	Cria uma nova figura.
figure;

%	Exibe uma das imagens do sistema de vis�o est�reo.
imshow(image);
title('Original Image (Left)');

end