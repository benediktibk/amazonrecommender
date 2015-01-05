function [rankingsEstimated, rankingsCorrect] = estimateRanking(rankings, similarities, testIndices, treshold, buyValue)
    userCount = size(rankings, 1);
    testIndicesCount = size(testIndices, 2);
    rankingsCorrect = rankings(1:userCount, testIndices);
    rankingsEstimated = sparse([], [], [], testIndicesCount, userCount);
    testProductSimilarities = similarities(:, testIndices);
    testProductSimilaritySums = sum(testProductSimilarities);
    [nonZeroSumRows, nonZeroSumColumns, nonZeroSums] = find(testProductSimilaritySums > 0);
    nonZeroCount = size(nonZeroSums, 1);
    
    for i = 1:nonZeroCount
        testProductSimilarities(:, nonZeroSumColumns(i)) = testProductSimilarities(:, nonZeroSumColumns(i))./nonZeroSums(i);
    end
    
    for user = 1:userCount
        currentRankings = rankings(user, :);
        estimation = currentRankings*testProductSimilarities;
        [rows, columns] = find(estimation > treshold);
        rankingsEstimated(columns, user) = buyValue;
    end
    
    rankingsEstimated = rankingsEstimated';
end

