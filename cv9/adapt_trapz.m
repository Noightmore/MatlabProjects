function [I,k] = adapt_trapz(f,a,b,maxlevel,tol)
    % Funkce pro lichobeznikovou kvadraturu
    % f - aproximovana funkce 
    % a - Spodni hranice intervalu
    % b - Hornu hranice intervalu
    % maxlevel - Maximalni pocet urovni zjemneni
    % tol - presnost tolerance
    % I - aproximovana hodnota integralu
    % k - pocet potrebných urovní zjemneni
    
    lastApprx = 0;

    for n = 0:maxlevel
        
        dx = (b - a) / 2^n; % krok intervalu

        v = a:dx:b;
        vf = arrayfun(@(x) f(x), v); 
        % array fun aplikuje fci na kazdou hodnoty vektoru
        
        vfMultipliedBy2 = vf(2:numel(vf)-1) .* 2;
        vf(2:numel(vf) - 1) = vfMultipliedBy2;
    
        I = (sum(vf) * dx) * (1/2);
        
        if (tol > abs(lastApprx - I))
            k = n;
            break;
        end
        lastApprx = I;
    end
    k = maxlevel;
end