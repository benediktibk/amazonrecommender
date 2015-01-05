%% configuration
clc;
clear all;
nFolds = 5;
neighbourhoodSize = 25;
treshold = 2.2;
buyValue = 0.75;

%% load files
display('loading data');

rankings = loadData(buyValue, '../data/tiny.mat');

%% initialization
productCount = size(rankings, 2);

column_vector = zeros(1, size(rankings,2));
indices = crossvalind('Kfold', column_vector, nFolds);

precision = zeros(nFolds);
recall = zeros(nFolds);
evaluation_score = zeros(nFolds);

display('building model');
tic
similarityCache = calculateSimilarities(rankings, subtractAverageRankings);
toc

display('estimate rankings');
for i = 1:nFolds
    testIndices = (indices == i);
    trainingIndices = (indices ~= i); 
    [~, ~, testColumnsIndices] = find(testIndices' .* (1:size(testIndices)));
    [~, ~, trainColumnsIndices] = find(trainingIndices' .* (1:size(trainingIndices)));
    
    tic;
    display('building model cache');
    similarityCacheReduced = reduceSimilarityCache(similarityCache, trainingIndices, neighbourhoodSize);
    toc;
    
    display(' ')
    display(strcat('Fold #', num2str(i)));
    
    tic
    [rankingsEstimated, rankingsCorrect] = estimateRanking(rankings, similarityCache, sort(testColumnsIndices), treshold, buyValue);
    toc;
    
    %% checks
    display('check accuracy');
    [precision(i), recall(i)] = calculateMetrics(rankingsCorrect, rankingsEstimated);

    display(strcat('Precision:',num2str(precision(i))));
    display(strcat('Recall:',num2str(recall(i))));
end

precision_avg= mean(precision);
recall_avg = mean(recall);
evaluation_score_avg = mean(evaluation_score);

display('=======================================================');
display(strcat('Averaged results after ', num2str(nFolds), ' runs:'));
display(strcat('Precision: ', num2str(precision_avg(1))));
display(strcat('Recall: ', num2str(recall_avg(1))));
display(strcat('Evaluation Score: ', num2str(evaluation_score_avg(1))));




