function [result] = reduceSimilarityCache(similarityCache, trainingIndices, neighbourHoodSize)
    display('reduce similarity cache');
    n = size(similarityCache, 1);
    trainingVector = sparse(trainingIndices, 1, 1, n, 1);
    result = sparse([], [], [], n, n);
    
    for i = 1:n
        column = similarityCache(:,i).*trainingVector;
        [nonZeroRows, nonZeroColumns, values] = find(column);
        [valuesSorted, order] = sort(values,'descend');
        nonZeroRowsSorted = nonZeroRows(order);
        valueCount = min(size(valuesSorted, 1), neighbourHoodSize);
        bestValues = valuesSorted(1:valueCount);
        bestNonZeroRows = nonZeroRowsSorted(1:valueCount);
        result(:, i) = sparse(bestNonZeroRows, 1, bestValues, n, 1);
    end
end

