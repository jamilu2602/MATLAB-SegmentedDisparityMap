%==========================================================================
%                        LOAD IMAGES FROM A DATABASE
%
%   Script respons�vel por carregar um par de imagens est�reo que foi pre-
% viamente capturado. Utilizado, em geral, quando n�o h� c�meras ligadas ao
% ambiente.
%==========================================================================

function [lSnap, rSnap, error] = loadImages(database, scene, type)

%	L� os arquivos de imagem de um diret�rio.
pathL = strcat('../dataset/', database, '/', scene, '/im0.', type);
pathR = strcat('../dataset/', database, '/', scene, '/im1.', type);

%	L� os arquivos de imagem de um diret�rio.
try 
    lSnap = imread(pathL, type);
    rSnap = imread(pathR, type);
catch
    error = 1;
    return;
end

%   Vari�vel utilizada no controle de erros da fun��o; retorna 0 se tudo 
% correr bem.
error = 0;

end