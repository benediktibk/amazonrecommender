function [rankings] = loadData(buyValue, file)
    load(file);
    rankings = matrix;    
    originalBuyValue = 5;
    
    if (originalBuyValue ~= buyValue)
        [rows, columns] = find(rankings >= originalBuyValue);
        rankings(rows, columns) = buyValue;
    end    
end

