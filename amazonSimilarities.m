%% load files
clear all;
display('loading data');
buyValue = 5;
rankings = loadData(buyValue, 'small.mat');

%% initialization
productCount = size(rankings, 2);
minimalValue = 1e-10;
trainingData = 0.5;
neighbourhoodSize = 25;
trainingIndices = 1:(trainingData*productCount);
testIndices = (trainingData*productCount + 1):productCount;
treshold = 1.1;

%% calculation
tic;
display('build model');
similarityCache = buildModel(rankings, trainingIndices, neighbourhoodSize, 0);

display('estimate rankings');
[rankingsEstimated, rankingsCorrect] = estimateRanking(rankings, similarityCache, testIndices, treshold, buyValue);
toc;

%% checks
display('check accuracy');
[truePositive, falsePositive, falseNegative, trueNegative] = calculateMetrics(rankingsCorrect, rankingsEstimated);
precision = truePositive/(truePositive + falsePositive);
recall = truePositive/(truePositive + falseNegative);
display(strcat('precision:',num2str(precision)));
display(strcat('recall:',num2str(recall)));