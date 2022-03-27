function [x,U]=gauss_elim(A,b)

if det(A) - 1e-15 > 0  
    n=length(b);
    m=zeros(n,1);
    x=zeros(n,1);

    maxIndex=zeros(n,1);
    for k = 1:n
        for i = k:n
            if A(i,k) == max(A(:,k))
            maxIndex(k) = i;
            foo = A(k,:);
            A(k,:) = A(maxIndex(k),:);
            A(maxIndex(k),:) = foo;
            end           
        end
    end
    for j = 1:n-1
        m(j+1:n) = A(j+1:n,j)/A(j,j);
        for i = k+1:n
            A(i, j+1:n) = A(i,j+1:n)-m(i)*A(j,j+1:n);
        end
        b(j+1:n) = b(j+1:n)-b(j)*m(j+1:n);
    end
    U = triu(A);
    x(n) = b(n)/A(n,n);
    for l = n-1:-1:1
        b(1:l)=b(1:l)-x(l+1)* U(1:l,l+1);
        x(l)=b(l)/U(l,l);
    end
else
    error('singular');
end

end