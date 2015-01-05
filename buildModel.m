function [similarityCacheReduced] = buildModel(rankings, trainingIndices, neighbourhoodSize, subtractAverageRankings)
    similarityCache = calculateSimilarities(rankings, subtractAverageRankings);
    similarityCacheReduced = reduceSimilarityCache(similarityCache, trainingIndices, neighbourhoodSize);
end

