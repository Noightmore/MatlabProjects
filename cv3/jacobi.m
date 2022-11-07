function [x,flag,rr,it,rv] = jacobi(A,b,tol,maxiter)
    x = b;
    rv = zeros(maxiter,1);% vektor rezidui
    rv(1) =  norm(b - A * x); 
    
    for it = 1:maxiter-1
        converges = true;
        nextX = x;
        
        for i = 1:length(b)
            sum = 0;
            for j = 1:length(b)
                if i ~= j
                    sum = sum + A(i,j)*x(j);
                end
            end
            nextX(i) = -1 / A(i,i) * (sum - b(i));
            
            % Relative residuum
            rr = norm(b - A * nextX)/norm(b);% rel reziduum
    
            if rr > tol
                converges = false;
            end
        end

        x = nextX;
        rv(it+1) = norm(b-A*x);
        
        % check whether it diverges
        if isnan(rr) || isinf(rr)
            converges = false;
            flag = 4;
            break;
        end
        
        % if it converges
        if converges == true
            flag = 0;
            break;
        end
    end
    
    if it == maxiter-1 && ~(converges == true)
        flag = 1;
    end
    
    rv = rv(1:it+1,:);
end