function [x, res, k] = newton_diff(f,x0,x1,tol,maxit)
    k=0;
    vec = zeros(1, maxit);
    vec(1)=x0;
    vec(2)=x1;    
    
    for i=3:maxit
        % vypocteni dalsiho prvku
        vec(i) = vec(i-1) - (f(vec(i-1))) * ( (vec(i-1) - vec(i-2)) / (f(vec(i-1)) - f(vec(i-2))) );
        
        % Vypocteme relativni reziduum.
        % Protoze to jsou problemy typu f(x) = 0, muzeme se akorat
        % podivat, jestli je funkcní hodnota dostatecne blizko k nule.
        res = abs(f(vec(i)));
        
        % Pokud je dostatecně blizko nule,
        % v ramci tolerance,
        % tak hledani ukoncime
        if res < tol
            x = vec(i);
            break;
        end
        
        % pocetIter++
        k = k + 1;
    end

end
