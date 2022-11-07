clear
close all
clc

% 1)Vygenerujte vektor a přirozených čísel od 1 do 50.
a = 1:50

% 2) Vygenerujte vektor b, který bude obsahovat racionální čísla od 1 do 10 s krokem 0.2.
b = 1:0.2:10

% 3) Vygenerujte matici A o rozměrech 3x3, která bude obsahovat samé jednotky, nulovou
% matici B stejných rozměrů a jednotkovou matici D stejných rozměrů.

A = [1,1,1; 1,1,1; 1,1,1;] % A = ones(1)
B = [0,0,0; 0,0,0; 0,0,0;] % B = zeros(3)
D = [1,0,0; 0,1,0; 0,0,1;] % D = eye(3)

% 4) Spojte matice A, B a D do matice M o rozměrech 3x9.
M = [A; B; D;]

% 5) Deklarujte matici C tak, aby měla následující prvky:
%  ⎡ 1 − 1 1⎤
%⎢ ⎥C = 1 − 1 0⎢ ⎥
%⎢ ⎣ − 1 0 1⎥ ⎦

C = [1, -1, 1; 1, -1, 0; -1, 0, 1;]

% 6) Spočtěte inverzní matici matice C a výsledek uložte do matice B1

B1 = C^(-1)
% 7) Vynásobte matice C a B1:
% a. po prvcích
B1.*C
% b. maticově
B1*C

% 8) Vynásobte (maticově) matice M a C příslušně transponované tak, aby součin existoval,
% pokud to vůbec jde.

% M*C nejde

% 9) Přepište druhý sloupec C náhodnými hodnotami.

C(:, 1) = randi([-2, 2],1,3) % nebo rand(1,3)

% 10) Přepište první řádek C vlastními vymyšlenými hodnotami.

C(1,:) = [9, 6, 5;]

% 11) Z matice C vyberte submatici C1, která bude obsahovat prvky prvního řádku z
% posledních dvou sloupců.

C1 = C(:, end-1:end)

% 12) Prvkům matice C, které jsou větší nebo rovny nule přiřaďte hodnotu 1. Prvkům, které
% jsou menší než nula přiřaďte náhodné hodnoty.

C(C >= 0) = 1
C(C <= 0) = rand