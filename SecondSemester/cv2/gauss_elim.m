function [x, U] = gauss_elim(A,b)
    tol = 1e-15;
    x = zeros(length(b), 1);

    for i = 1 : size(A,2)
            ii = i;
            pd = A(i, i);
            r = A(i : size(A,1), i);

            for j = 1 : size(r)
                if r(j) > pd
                    ii = j;
                end
            end           
            
            foo = b(i);
            b(i) = b(ii);
            b(ii) = foo;            
            A([i, ii], :) = A([ii, i], :);
            if (A(i, i)) < tol
                error("matrix is singular");
            end
    end    
    
    U = A;
    for i = 1 : (length(b) - 1)
        if A(i,i) < tol
            error("matrix is singular");
        else
            for j = length(b) : -1 : (i + 1)
                foo = A(j, i) / A(i, i);
                A(j,:) = A(j, :) - foo.*(A(i, :));
                b(j) = b(j) - foo*b(i);
            end
        end        
    end
     
    U = A;
    p = 0;
    
    % zpetny chod
    for i = length(b) : -1 : 1
        for j = (length(b) - 1 - p) : -1 : 1
            foo = A(j, i) / A(i, i);
            A(j,:) = A(j,:) - foo*(A(i,:));
            if A(j,i) < tol
                A(j,i) = 0;
            end
            b(j) = b(j) - foo*b(i);
        end
        p = p + 1;
    end
    
    for i = 1 : length(b)
        if (abs(A(i, i)) <= tol) 
            error("singular")
        else
            x(i) = b(i) / A(i, i);
        end
    end   
end 