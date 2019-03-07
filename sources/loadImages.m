%==========================================================================
%                        LOAD IMAGES FROM A DATABASE
%
%   Script responsável por carregar um par de imagens estéreo que foi pre-
% viamente capturado. Utilizado, em geral, quando não há câmeras ligadas ao
% ambiente.
%==========================================================================

function [lSnap, rSnap, error] = loadImages(database, scene, type)

%	Lê os arquivos de imagem de um diretório.
pathL = strcat('../dataset/', database, '/', scene, '/im0.', type);
pathR = strcat('../dataset/', database, '/', scene, '/im1.', type);

%	Lê os arquivos de imagem de um diretório.
try 
    lSnap = imread(pathL, type);
    rSnap = imread(pathR, type);
catch
    error = 1;
    return;
end

%   Variável utilizada no controle de erros da função; retorna 0 se tudo 
% correr bem.
error = 0;

end