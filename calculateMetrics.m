function [precision, recall, evaluation_score] = calculateMetrics(correct, estimated, buyValue)
    n = size(correct, 1);
    m = size(correct, 2);
    equalityResult = correct == estimated;
    inequalityResult = correct ~= estimated;
    
    truePositive = sum(sum(equalityResult & correct > 0));
    trueNegative = sum(sum(equalityResult & correct == 0));
    falseNegative = sum(sum(inequalityResult & correct > 0));
    falsePositive = sum(sum(inequalityResult & correct == 0));
    
    precision = truePositive/(truePositive + falsePositive);
    recall = truePositive/(truePositive + falseNegative);
    
    
    % Sl – sessions in submitted solution file
    % S - All sessions in the test set
    % Sb – sessions in test set which end with buy
    
    % s – session in the test set
    % As – predicted bought items in session s
    % Bs – actual bought items in session s
    SbIndices = any(correct==buyValue,2);
    
    addee = sum(SbIndices) / size(correct,1); % |Sb|/|S|
    
    summed = sum(estimated & correct, 2);
    ored = sum(estimated | correct, 2);
    
    [divisionAllowedRows, divisionAllowedCols, ~] = find(ored);
    
    evaluation_matrix = zeros(size(correct,1), 1);
    
    evaluation_matrix(divisionAllowedRows, divisionAllowedCols) = summed(divisionAllowedRows, divisionAllowedCols) ./ ored(divisionAllowedRows, divisionAllowedCols);
    [nonZeroRows, nonZeroColumns, ~] = find(evaluation_matrix);
    [zeroRows, zeroColumns, ~] = find(~evaluation_matrix);
    
    evaluation_matrix(nonZeroRows, nonZeroColumns) = evaluation_matrix(nonZeroRows, nonZeroColumns) + addee;
    evaluation_matrix(zeroRows, zeroColumns) = -addee;
    
    evaluation_score = sum(evaluation_matrix);
end

