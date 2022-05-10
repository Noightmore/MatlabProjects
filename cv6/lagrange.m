function yq = lagrange(x,y,xq)
    xcount = numel(x);
    yq = zeros(numel(xq), 1);
    
    for h=1:numel(xq)
        
        n = xq(h);

        for i=1:xcount
            foo = 1;           
            for j=1:xcount
                if i ~= j
                    foo = foo * (n - x(j)) / (x(i) - x(j));
                end
            end
            yq(h) = yq(h) + (y(i) * foo);
        end

    end
    
    % overeni jestli se jedna o sloupcovy vektor
    if (iscolumn(yq))
        yq = yq';
    end
end
