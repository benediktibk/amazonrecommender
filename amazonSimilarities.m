%% configuration
clc;
clear all;
nFolds = 5;
neighbourhoodSize = 25;
treshold = 2.2;
buyValue = 0.7125;
useAdvancedSimiliarityMeasurement = 1;

%% load files
display('loading data');
rankings = loadData(buyValue, '../data/tiny.mat');

%% model building
display('building model');
tic
similarityCache = calculateSimilarities(rankings, useAdvancedSimiliarityMeasurement);
toc

%% recommending
column_vector = zeros(1, size(rankings,2));
foldedIndices = crossvalind('Kfold', column_vector, nFolds);
recommender(foldedIndices, nFolds, rankings, similarityCache, neighbourhoodSize, treshold, buyValue)
