function [rankingsEstimated, rankingsCorrect] = estimateRanking(rankings, similarities, testIndices, treshold, buyValue)
    userCount = size(rankings, 1);
    testIndicesCount = size(testIndices, 2);
    rankingsCorrect = rankings(1:userCount, testIndices);
    rankingsEstimated = zeros(userCount, testIndicesCount);
    testProductSimilarities = similarities(:, testIndices);
    testProductSimilaritySums = sum(testProductSimilarities);
    
    for user = 1:userCount
        currentRankings = rankings(user, :);
        estimation = (currentRankings*testProductSimilarities)./testProductSimilaritySums;
        [rows, columns] = find(estimation > treshold);
        rankingsEstimated(user, columns) = buyValue;
    end
end

