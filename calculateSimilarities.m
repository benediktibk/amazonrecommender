function [result] = calculateSimilarities(rankings, subtractAverage)
    if (subtractAverage)
        averageRankings = mean(rankings, 2);
        rankings = bsxfun(@minus, rankings, averageRankings);
    end
    products = rankings'*rankings;
    absoluteValues = sqrt(diag(products));
    inverseAbsoluteValues = diag(1./absoluteValues);
    productsReduced = tril(products, -1);
    result = (productsReduced*inverseAbsoluteValues)'*inverseAbsoluteValues;
end