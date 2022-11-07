function [x,flag,rr,it,rv] = gauss_seidel(A,b,tol,maxit)
    x = b;
    
    rv = zeros(maxit, 1);
    rv(1) = norm(b - A*x);

    for it = 1:(maxit - 1)
        converges = true;
        
        for row = 1:length(b)
            sum = 0;
            
            for item = 1:length(b)
                if row ~= item
                    sum = sum + A(row, item) * x(item);
                end
            end

            x(row) = -1 / A(row,row) * (sum - b(row));

            rr = norm(b - A * x) / norm(b); % rel reziduum
    
            if rr > tol
                converges = false;
            end
        end

        rv(it + 1) = norm(b - A * x);
    
        if isnan(rr) || isinf(rr)
            converges = false;
            flag = 4;
            break;
        end

        if converges
            flag = 0;
            break;
        end
    end

    if it == maxit-1 && ~(converges == true)
        flag = 1;
    end
    
    rv = rv(1:it+1,:); % vektor rezidui
end