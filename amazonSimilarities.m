%% load files
clear all;
display('loading data');
buyValue = 2;
rankings = loadData(buyValue, 'data/test.mat');

%% initialization
productCount = size(rankings, 2);
trainingData = 0.5;
neighbourhoodSize = 25;
trainingIndices = 1:(trainingData*productCount);
testIndices = (trainingData*productCount + 1):productCount;
treshold = 1.1;

%% calculation
tic;
similarityCache = buildModel(rankings, trainingIndices, neighbourhoodSize, 0);
[rankingsEstimated, rankingsCorrect] = estimateRanking(rankings, similarityCache, testIndices, treshold, buyValue);
toc;

%% checks
display('check accuracy');
[precision, recall] = calculateMetrics(rankingsCorrect, rankingsEstimated);

display(strcat('precision:',num2str(precision)));
display(strcat('recall:',num2str(recall)));