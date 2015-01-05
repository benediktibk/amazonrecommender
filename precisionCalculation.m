function [precision] = precisionCalculation(buyValue, treshold)
    rankings = loadData(buyValue, 'data/test.mat');
    productCount = size(rankings, 2);
    trainingData = 0.5;
    neighbourhoodSize = 25;
    trainingIndices = 1:(trainingData*productCount);
    testIndices = (trainingData*productCount + 1):productCount;
    
    similarityCache = buildModel(rankings, trainingIndices, neighbourhoodSize, 0);
    [rankingsEstimated, rankingsCorrect] = estimateRanking(rankings, similarityCache, testIndices, treshold, buyValue);
    
    [precision, recall] = calculateMetrics(rankingsCorrect, rankingsEstimated);
    display(strcat('treshold:',num2str(treshold),', buyValue:',num2str(buyValue),', precision:',num2str(precision),', recall:',num2str(recall)));
end
