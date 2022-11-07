function z = integral(x,y)
    if length(x) == length(y)
        z=0;
        for i=1:length(x)-1
            z=z+0.5*(x(i+1)+x(i))*(y(i+1)+y(i));
        end
    end
end