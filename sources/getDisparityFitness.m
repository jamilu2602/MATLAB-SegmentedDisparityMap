%==========================================================================
%                C�LCULO DA EFIC�CIA DO MAPA DE DISPARIDADES
%
%   Script respons�vel por calcular a taxa de qualidade (fitness) do mapa 
% de disparidades passado como par�metro. Tal taxa � dada pelo n�mero de 
% pixels nulos presentes no mapa; quanto menor este n�mero, melhor o mapa 
% �.
%==========================================================================

function fitness = getDisparityFitness(dMap)

%   Obt�m as dimens�es do mapa de disparidades.
count = 0;

[height, width] = size(dMap);

%	Conta o n�mero de pixels nulos que est�o presentes no mapa.
for i = 1 : height;
    for j = 1 : width
        if dMap(i, j) == 0
            count = count + 1;
        end
    end
end

%	Calcula a efici�ncia do mapa.
dimension = height * width;
fitness = (count / dimension) * 100;

end