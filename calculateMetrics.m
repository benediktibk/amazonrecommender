function [truePositive, falsePositive, falseNegative, trueNegative] = calculateMetrics(correct, estimated)
    n = size(correct, 1);
    m = size(correct, 2);
    equalityResult = correct == estimated;
    inequalityResult = correct ~= estimated;
    
    truePositive = sum(sum(equalityResult & correct > 0));
    trueNegative = sum(sum(equalityResult & correct == 0));
    falseNegative = sum(sum(inequalityResult & correct > 0));
    falsePositive = sum(sum(inequalityResult & correct == 0));
end

