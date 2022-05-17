function I = composite_midpoint(f,a,b,n)
    % funkce pro obdelnikove pravidlo
    
    % f - Integrovana funkce
    % a - Spodni hranice intervalu
    % b - Horni hranice intervalu
    % n - Jemnost deleni

    % Krok pro interval
    dx = (b - a) / n;
    % Vytvorenii intervalu
    area = a:dx:b;
    % Je potreba odstranit posledni hodnotu protoze matlab intervaly jsou inkluzivni
    
    % Navic ke kazdemu bodu se pricte jedna polovina sirky intervalu to nam
    % da hodnotu ze stredu intervalu
    area = area(1: numel(area) - 1) + (dx/2);
    % na kazdy stred se aplikuje funkci jez ji aproximuje ve stredu, to nam
    % vrati jeji funkcni hodnotu ve stredu
    funcValInTheMiddle = arrayfun(@(x) f(x), area);
    
    % Vytvoreni obdelniku:
    heigh = funcValInTheMiddle;
    width = dx;
    distriPolygon = sum(heigh) * width; % nasobeni az po souctu prvku 
    % (distributivni zakony)
    I = distriPolygon;
end