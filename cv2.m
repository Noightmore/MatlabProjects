clear
close all
clc

% praci jsem delal ve dvoji s Adam Petricek

% 1) generace 3D pole s nahodnymi rozmery v rozsahu 10-40 
C = randn(floor(10 + (40 - 10)* rand(1,3)))
% k zaokrouhleni take: floor, ceil, fix, round

% 2) prumer vsech prvku C 

% mean2(C)

soucet = 0;
pocetPrvku = 0;

for i = 1:size(C, 1)
    for j = 1:size(C, 2)
        for k = 1:size(C, 3)
              soucet = soucet + C(i,j,k);
              % pocetPrvku = pocetPrvku + 1
        end
    end
end

% prumer pomoci cyklu for
pocetPrvku = numel(C)
soucet/pocetPrvku

% pomoci sum()
sum(C, 'all')/numel(C)

% 3) zmenseni 3D pole na 2D pomoci prikazu squeeze()

C = squeeze(C(1,:,:))
% size(C)

for x = 1:size(C,1)
    for y = 1:size(C, 2)
        C(x,y) = C(x,y) - sum(C(x,:), 'all')/numel(C(x,:));
    end
end

% 4) funkce
function out = sinSquaredPlusCos(x)
    out = sin(x).*sin(x).*cos(x)
end

