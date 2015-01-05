function [rankingsEstimated, rankingsCorrect] = estimateRanking(rankings, similarities, testIndices, treshold, buyValue)
    display('estimate rankings');
    userCount = size(rankings, 1);
    testIndicesCount = size(testIndices, 2);
    rankingsCorrect = rankings(1:userCount, testIndices);
    testProductSimilarities = similarities(:, testIndices);
    testProductSimilaritySums = sum(testProductSimilarities);
    [~, nonZeroSumColumns, nonZeroSums] = find(testProductSimilaritySums > 0);
    nonZeroCount = size(nonZeroSums, 1);
    
    for i = 1:nonZeroCount
        testProductSimilarities(:, nonZeroSumColumns(i)) = testProductSimilarities(:, nonZeroSumColumns(i))./nonZeroSums(i);
    end
    
    estimation = rankings*testProductSimilarities;
    [rows, columns] = find(estimation > treshold);
    rankingsEstimated = sparse(rows, columns, buyValue, userCount, testIndicesCount);
end

