%==========================================================================
%                CÁLCULO DA EFICÁCIA DO MAPA DE DISPARIDADES
%
%   Script responsável por calcular a taxa de qualidade (fitness) do mapa 
% de disparidades passado como parâmetro. Tal taxa é dada pelo número de 
% pixels nulos presentes no mapa; quanto menor este número, melhor o mapa 
% é.
%==========================================================================

function fitness = getDisparityFitness(dMap)

%   Obtém as dimensões do mapa de disparidades.
count = 0;

[height, width] = size(dMap);

%	Conta o número de pixels nulos que estão presentes no mapa.
for i = 1 : height;
    for j = 1 : width
        if dMap(i, j) == 0
            count = count + 1;
        end
    end
end

%	Calcula a eficiência do mapa.
dimension = height * width;
fitness = (count / dimension) * 100;

end