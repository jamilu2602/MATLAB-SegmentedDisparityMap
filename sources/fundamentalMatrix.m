%==========================================================================
%                       ESTIMAÇÃO DA MATRIZ FUNDAMENTAL
%
%   Script responsável pela estimação da matriz fundamental. Recebe os pa-
% res de pontos correspondentes entre as imagens, e retorna a matriz funda-
% mental, além de novos conjuntos de correspondências, que contêm apenas as
% que foram mapeadas pela matriz. Também utiliza uma variável de controle
% de erros.
%==========================================================================

function [lPts, rPts, F, error] = fundamentalMatrix(lPts, rPts)

%   Obtém o número de correspondências iniciais.
[lines, ~] = size(lPts);

%	Escolhe a métrica de qualidade da matriz fundamental de acordo com o 
% número de correspondências iniciais. Se forem mais de dezesseis...
if lines >= 16
    %   ...utiliza-se a métrica de Least Median of Squares (LMedS). Já se
    % forem menos que dezesseis, mas ao menos oito...
    error = 0;
    method = 'LMedS';

else if lines >= 8
        %   ...utiliza-se a métrica de M-estimator Sample Consensus (MSAC).
        % Mas se forem menos de oito correspondências...
        error = 0;
        method = 'MSAC';
    else
        %   ...daí não é possível estimar a matriz fundamental.
        error = 1;
        return;
    end
end

%   Estima a matriz fundamental, de acordo com a métrica de qualidade esco-
% lhida.
if error == 0
    
    [F, inliers] = estimateFundamentalMatrix(lPts, rPts, 'Method', method);

    lPts = lPts(inliers, :);
    rPts = rPts(inliers, :);

else
    
    F = zeros(3);
    
    lPts = [0 0];
    rPts = [0 0];

end

end