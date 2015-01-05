function [rankingsEstimated, rankingsCorrect] = estimateRanking(rankings, similarities, testIndices, treshold, buyValue)
    userCount = size(rankings, 1);
    testIndicesCount = size(testIndices, 2);
    rankingsCorrect = rankings(1:userCount, testIndices);
    rankingsEstimated = sparse([], [], [], testIndicesCount, userCount);
    testProductSimilarities = similarities(:, testIndices);
    testProductSimilaritySums = sum(testProductSimilarities);
    
    for user = 1:userCount
        currentRankings = rankings(user, :);
        estimation = (currentRankings*testProductSimilarities)./testProductSimilaritySums;
        [rows, columns] = find(estimation > treshold);
        rankingsEstimated(columns, user) = buyValue;
    end
    
    rankingsEstimated = rankingsEstimated';
end

