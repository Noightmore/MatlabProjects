function z = zintegruj(x,y)
    if length(x) == length(y)
        z(1)=0;
        for i=1:length(x)-1
            z(i+1)=z(i)+0.5*(x(i+1)+x(i))*(y(i+1)+y(i));
        end
    end
end