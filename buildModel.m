function [similarityCacheReduced] = buildModel(rankings, trainingIndices, neighbourhoodSize, subtractAverageRankings)
    similarities = calculateSimilarities(rankings, subtractAverageRankings);
    similarityCache = prepareSimilarityCache(similarities);
    similarityCacheReduced = reduceSimilarityCache(similarityCache, trainingIndices, neighbourhoodSize);
end

