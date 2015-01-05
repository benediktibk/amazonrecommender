%% init
clc;
clear all;

%% optimization for precission
% f = @(x) (-1)*precisionCalculation(x(1), x(2));
% treshold = fminsearch(f, [2, 1.1]);
% display(treshold);

%% folded optimization
nFolds = 5;
neighbourhoodSize = 25;
buyValue = 0.7125;
useAdvancedSimiliarityMeasurement = 0;

%% load files
display('loading data');

rankings = loadData(buyValue, '../data/test.mat');

%% model building

display('building model');
tic
similarityCache = calculateSimilarities(rankings, useAdvancedSimiliarityMeasurement);
toc

column_vector = zeros(1, size(rankings,2));
foldedIndices = crossvalind('Kfold', column_vector, nFolds);

f = @(x) (-1)*recommender(foldedIndices, nFolds, rankings, similarityCache, neighbourhoodSize, x(1), x(2));
treshold = fminsearch(f, [2.2, 0.7125]);
display(treshold);