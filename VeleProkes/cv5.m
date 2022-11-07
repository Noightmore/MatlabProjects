clc; close all; echo off;

% 1) pravidelny sestiuhelni

figure()
theta = 0:pi/3:2*pi;
r = ones(1,7);
polarplot(theta,r)


% 3)  Vykreslete hodnoty funkcí f(x), f(x,1) a f(x,2) v rozmezí x = -5...5 skrokem délky 0,05.

x = -5; 0.05; 5;

% a. do jednoho 2D obrázku

figure()
x1 = funkce2(x);
x2 = funkce2(x,1);
x3 = funkce2(x,2);

plot(0, x1);
hold on
plot(x, x2);
plot(x, x3);
hold off;

title("grafy funkci");
xlabel('x');
ylabel('f(x,y)');
legend({'f(x)','f(x,1)', 'f(x,2)'},'Location','northeast');

% b. každou   do   vlastního   2D   podobrázku   (subplot)   a   propojte osy   x   pomocí linkaxes.

figure()
ax1 = subplot(1,3,1);
plot(x,x1,"blue");
xlabel('x');
ylabel('f(x,y)');
legend({'f(x)'},'Location','northeast');

ax2 = subplot(1,3,2);
plot(x,x2,"red");
xlabel('x');
ylabel('f(x,y)');
legend({'f(x,1)'},'Location','northeast');

ax3 = subplot(1,3,3);
plot(x,x3,"green");
xlabel('x') ;
ylabel('f(x,y)');
legend({'f(x,2)'},'Location','northeast');

linkaxes([ax1,ax2,ax3],'xy');

% velikosti: PDF(+-8kB) < JPG(+-24kB) < BMP(+-700kB)
% kvalita: JPG(rozmazane, divne graficke artefakty) < BMP(rozmazane, relativne dobre po oddaleni) < PDF(ostre is priblizenim)
% zaver: PDF format je jednoznacne nejlepsi volba

% 4) Vykreslete 3D graf funkce f(x,y) pro x = -5...5 skrokem délky 0,1 a y = -6...6 skrokem délky 0,2

figure()
xh = meshgrid(-5:0.1:5);
yh = meshgrid(-6:0.2:6);

[x,y] = meshgrid(xh,yh);

xf = funkce(xh,xy);

mesh(x,y,xf);
title ("Funkce s ruznymi argumenty");


% 2) Napište   funkci   v   Matlabu,   která   vyhodnotí   funkční   předpis   daný   níže. 
% Pokud   budeuživatelem   zadaná   pouze   jedna   vstupní   proměnná  x,  
% pak   nechť  y  má   standardníhodnotu nula.
% Funkce tedy sama rozpozná kolik vstupních proměnných uživatel zadá(nargin). 
% Funkce nechť funguje vektorově, tedy zadá-li uživatel libovolně rozměrnépole hodnot,
% vyhodnotí se funkce pro každý prvek pole zvlášť (element-wise).
% Zákaz použití cyklů for nebo while.)

function out = funkce2(x,y)
    switch nargin
        case 1
            y = 0;
        otherwise
            % nic se neprovede
    end
    out = x.exp(-x.^2-y.^2) + tanh(x.y);
end

function out = funkce(x,y)
    switch nargin
        case 1
            if x == null
                x = 0;
            else
                y = 0;
            end
        otherwise
            % nic se neprovede
    end
    out = x.exp(-x.^2-y.^2) + tanh(x*y);
end
