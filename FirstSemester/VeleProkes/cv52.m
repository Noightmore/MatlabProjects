clc; close all; echo off;

% 1) Nakreslete pravidelný šestiúhelník pomocí příkazu plot

hexagon = figure();
corners = 0:60:360;
xCoords = sind(corners);
yCoords = cosd(corners);
plot(xCoords, yCoords);

% 3) Vykreslete hodnoty funkcí f(x), f(x,1) a f(x,2) v rozmezí x = -5...5 s krokem délky 0,05.

x = -5:0.05:5;
fx = funkce(x);
fx1 = funkce(x, 1);
fx2 = funkce(x, 2);

% b. do jednoho 2D obrázku

all_in_one = figure();
plot(x, fx, x, fx1, x, fx2);
title('f(x)');
xlabel('x');
ylabel('f(x)');
legend('f(x)', 'f(x, 1)', 'f(x, 2)');

% b. každou do vlastního 2D podobrázku (subplot) a propojte osy x pomocí
% linkaxes.

subplots = figure();
subplot(3, 1, 1);
plot(x, fx, col="red");
title('f(x)');
xlabel('x');
ylabel('f(x)');
legend('f(x)');

subplot(3, 1, 2);
plot(x, fx1, col="blue");
title('f(x, 1)');
xlabel('x');
ylabel('f(x, 1)');
legend('f(x, 1)');

subplot(3, 1, 3);
plot(x, fx2, col="green");
title('f(x, 2)');
xlabel('x');
ylabel('f(x, 2)');
legend('f(x, 2)');

% Popište osy, vložte nadpis a legendu. Jednotlivé čáry barevně odlište. Výsledek (a)
% uložte do souboru formátu JPG, BMP a PDF a porovnejte velikosti souborů a kvalitu
% obrázku. Výsledek (b) uložte do souboru formátu FIG.

saveas(all_in_one, "3a.bmp");
saveas(all_in_one, "3a.jpg");
saveas(all_in_one, "3a.pdf");

saveas(subplots, "3b.fig");

% velikosti: PDF(+-8kB) < JPG(+-24kB) < BMP(+-700kB)
% kvalita: JPG(rozmazane, divne graficke artefakty) < BMP(rozmazane, relativne dobre po oddaleni) < PDF(ostre is priblizenim)
% zaver: PDF format je jednoznacne nejlepsi volba


% 4) Vykreslete 3D graf funkce f(x,y) pro x = -5...5 s krokem délky 0,1 a y = -6...6 s krokem
% délky 0,2

three = figure();
xF = -5:0.1:5;
yF = -6:0.2:6;
[X,Y]=meshgrid(xF,yF);
Z = funkce(X, Y);
surf(X, Y, Z);

% 2)
% Napište funkci v Matlabu, která vyhodnotí funkční předpis daný níže. Pokud bude
% uživatelem zadaná pouze jedna vstupní proměnná x, pak nechť y má standardní
% hodnotu nula. Funkce tedy sama rozpozná kolik vstupních proměnných uživatel zadá
% (nargin). Funkce nechť funguje vektorově, tedy zadá-li uživatel libovolně rozměrné
% pole hodnot, vyhodnotí se funkce pro každý prvek pole zvlášť (element-wise). Zákaz
% použití cyklů for nebo while.

function out = funkce(x, y)
    if (nargin == 1)    
        y = 0;
    end
    out=x.*exp(-x.^2-y.^2)+tanh(x.*y);
end