function [x, U] = gm2(A,b)
   
    eps = 1e-15;
   
    for i = 1 : size(A,2) 
            a = A(i : size(A,1), i);
            d = A(i, i);
            y = i;
           
            for j = 1 : size(a) % kontrola nejvetsiho prvku
                if r(j) > d
                    y = j;
                end
            end
           
            A([i y], :) = A([y i], :);
            help = b(i);
            b(i) = b(y);
            b(y) = help;
            
            if (A(i, i)) < eps
                error("matrix is singular");
            end
    end    
    
    for j = 1 : (length(b) - 1)
        if A(j,j) < eps
            error("matrix is singular");
        end
        for k = length(b) : -1 : (j + 1)
            del = A(k, j) / A(j, j);
            A(k,:) = A(k, :) - del.*(A(j, :));
            b(k) = b(k) - del*b(j);
        end
    end
    
    x = zeros(length(b), 1);
    U = A;
    
    o = 0;
    for l = length(b) : -1 : 2
        %if U(l,l) < eps
        %    error("matrix is singular");
        %end
        for m = (length(b) - 1 - o) : -1 : 1
            del = A(m, l) / A(l, l);
            A(m,:) = A(m,:) - del*(A(l,:));
            if A(m,l) < eps
                A(m,l) = 0;
            end
            b(m) = b(m) - del*b(l);
        end
        o = o + 1;
    end
    
    for n = 1: length(b)
        x(n) = b(n) / A(n, n);
        if (abs(A(n, n)) <= eps) 
            error("singular")
        end
    end
end