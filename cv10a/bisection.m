function [x,res,k] = bisection(f,a,b,tol,maxit)
    x = b;
    k = 0;
    res = 0;
    dolni = a;
    horni = b;
    
    while (abs(f(x)) > tol) && (k < maxit)
        x = 0.5 * (dolni + horni);   
    
        if (f(x) * f(b) < 0)
            dolni = x;
        else
            horni = x;
        end
        k = k + 1;
        res = abs(f(x));
    end
end