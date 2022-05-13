function [k,q] = lin_regression(x,y)

    if (isrow(x)) 
        x = x';
    end
    if (isrow(y))
        y = y';
    end
    
    k = (numel(x) * sum(x .* y) - sum(x) * sum(y)) / (numel(x) * sum(x.^2) - sum(x)^2); 
    q = (sum(x.^2) * sum(y) - sum(x) * sum(x .* y)) / (numel(x) * sum(x.^2) - sum(x)^2); 
end