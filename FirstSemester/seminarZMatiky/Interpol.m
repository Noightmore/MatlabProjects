function a = Interpol(x,y)
    n = length(x);
    A = x.^0;
    for i=1:n-1
        A=[x.^i,A];
    end
    a=A\y;
end