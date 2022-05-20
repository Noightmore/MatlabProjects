function [x,res,k] = newton(f,fp,x0,tol,maxit)
    k = 0;
    res = 0;
    last_x = x0;
    
    while k < maxit
        x = last_x - (f(last_x) / fp(last_x));
        res = abs(last_x - x);

        if res < tol
            break;
        end

        last_x = x;
        k = k + 1;
    end
end

