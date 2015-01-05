function [result] = prepareSimilarityCache(similarities)
    n = size(similarities, 1);
    result = sparse([], [], [], n, n);
    
    for product = 1:n
        columnValues = similarities(1:product, product);
        rowValues = similarities(product, (product + 1):n)';
        result(:, product) = [columnValues;rowValues];        
    end
end

