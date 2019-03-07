%==========================================================================
%                        REMOÇÃO DE BLOCOS NULOS
%
%   Script responsável pela remoção do máximo de blocos verticais de tons 
% de cinza nulos do mapa de disparidades passado como parâmetro. Retorna o 
% mesmo mapa, corrigido.
%==========================================================================

function dMap = removeGaps(dMap)

%	Inicializa as variáveis necessárias no algoritmo.
var = 1;
[lines, ~] = size(dMap);

%	Remove os blocos nulos de cinza do lado esquerdo do mapa.
while var ~= 0
    
    for i = 2:lines
        if dMap(i, 1) ~= 0
            var = 0;
        end
    end
    
    if var == 1
        dMap(:, 1) = [];
    end
    
end

%	Reinicializa as variáveis necessárias no algoritmo.
var = 1;
[lines, columns] = size(dMap);

%	Remove os blocos nulos de cinza do lado direito do mapa.
while var ~= 0
    
    for i = 2:lines
        if dMap(i, columns) ~= 0
            var = 0;
        end
    end
    
    if var == 1
        dMap(:, columns) = [];
        [lines, columns] = size(dMap);
    end
    
end
    
end