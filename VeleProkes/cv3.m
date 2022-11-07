clear
close all
clc

% 1) vygenerujte nahodnou matici A o rozmerech 1000x2000 s nulovou stredni
% hodnotou a jednotkovym rozptylem
A = randn(1000,2000); % 1000x2000

% 2) Matici B definujte tak, že každý její prvek je roven zaokrouhlenému odpovídajícímu prvku matice A.
B = round(A);

% 3)  Setřiďte sloupce matice B lexikograficky pomocí bublinkové metodyod největšího prvku po nejmenší
B2 = B;

for i = 1:size(B, 2)
    for col = 1:size(B, 2) - i
        for row = 1:size(B,1)
            if B(row,col+1) > B(row,col)
                temp = B(:,col);
                B(:,col) = B(:,col+1);
                B(:,col+1) = temp;
                break;
            elseif  B(row,col+1) < B(row,col)
                 break;
            end
        end 
    end
end

mean(B == sortrows(B2.','descend').','all')