function [result] = calculateSimilarities(rankings, subtractAverage)
    if (subtractAverage)
        averageRankings = mean(rankings, 2);
        rankings = bsxfun(@minus, rankings, averageRankings);
    end
    products = rankings'*rankings;
    absoluteValues = sqrt(diag(products));
    productCount = size(products, 1);
    indices = 1:productCount;
    inverseAbsoluteValues = 1./absoluteValues;
    inverseAbsoluteValuesMatrix = sparse(indices, indices, inverseAbsoluteValues, productCount, productCount);
    productsReduced = tril(products, -1);
    result = (productsReduced*inverseAbsoluteValuesMatrix)'*inverseAbsoluteValuesMatrix;
end