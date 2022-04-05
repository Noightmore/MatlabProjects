function yq = lagrange(x,y,xq)
    n=size(x,2);
    size(x, 2)
    I=ones(n,size(xq,2));

    for i=1:n
      for j=1:n
         if (i~=j)
            I(i,:)=I(i,:).*((xq-x(j))/(x(i)-x(j)));
         end
      end
    end
    yq=0;
   for i=1:n
      yq=yq+y(i)*I(i,:);
   end
end


