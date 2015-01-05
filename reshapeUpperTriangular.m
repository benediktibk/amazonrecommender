function [rows, columns, values] = reshapeUpperTriangular(A, minimalValue)
    n = size(A, 1);  
    reduction = A > minimalValue;
    AReduced = A.*reduction;
    [rows, columns, values] = find(AReduced);
end

