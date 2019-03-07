%==========================================================================
%                       ESTIMA��O DA MATRIZ FUNDAMENTAL
%
%   Script respons�vel pela estima��o da matriz fundamental. Recebe os pa-
% res de pontos correspondentes entre as imagens, e retorna a matriz funda-
% mental, al�m de novos conjuntos de correspond�ncias, que cont�m apenas as
% que foram mapeadas pela matriz. Tamb�m utiliza uma vari�vel de controle
% de erros.
%==========================================================================

function [lPts, rPts, F, error] = fundamentalMatrix(lPts, rPts)

%   Obt�m o n�mero de correspond�ncias iniciais.
[lines, ~] = size(lPts);

%	Escolhe a m�trica de qualidade da matriz fundamental de acordo com o 
% n�mero de correspond�ncias iniciais. Se forem mais de dezesseis...
if lines >= 16
    %   ...utiliza-se a m�trica de Least Median of Squares (LMedS). J� se
    % forem menos que dezesseis, mas ao menos oito...
    error = 0;
    method = 'LMedS';

else if lines >= 8
        %   ...utiliza-se a m�trica de M-estimator Sample Consensus (MSAC).
        % Mas se forem menos de oito correspond�ncias...
        error = 0;
        method = 'MSAC';
    else
        %   ...da� n�o � poss�vel estimar a matriz fundamental.
        error = 1;
        return;
    end
end

%   Estima a matriz fundamental, de acordo com a m�trica de qualidade esco-
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