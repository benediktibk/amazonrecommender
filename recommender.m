function [ precision_avg ] = recommender(foldedIndices, nFolds, rankings, similarityCache, neighbourhoodSize, treshold, buyValue)
    precision = zeros(1,nFolds);
    recall = zeros(1,nFolds);
    evaluation_score = zeros(1,nFolds);

    for i = 1:nFolds
        testIndices = (foldedIndices == i);
        trainingIndices = (foldedIndices ~= i); 
        [~, ~, testColumnsIndices] = find(testIndices' .* (1:size(testIndices)));
        [~, ~, trainColumnsIndices] = find(trainingIndices' .* (1:size(trainingIndices)));

        tic;
        display('building model cache');
        similarityCacheReduced = reduceSimilarityCache(similarityCache, trainColumnsIndices, neighbourhoodSize);
        toc;

        display(' ')
        display(strcat('Fold #', num2str(i)));

        tic
        [rankingsEstimated, rankingsCorrect] = estimateRanking(rankings, similarityCacheReduced, sort(testColumnsIndices), treshold, buyValue);
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

end

