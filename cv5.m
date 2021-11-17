% 1) pravidelny sestiuhelni

theta = 0:pi/3:2*pi;
r = ones(1,7);
polarplot(theta,r)


% 3)  Vykreslete hodnoty funkcí f(x), f(x,1) a f(x,2) v rozmezí x = -5...5 skrokem délky 0,05.

x = -5; 0.05; 5;

% a. do jednoho 2D obrázku
plot(x,0)
hold on
plot(x,1)
plot(x,2)
hold off

title = "nadpis";
legend('cos(x)', 'cos(2x)', 'cos(3x)');
% b. každou   do   vlastního   2D   podobrázku   (subplot)   a   propojte osy   x   pomocí linkaxes.

ax1 = subplot(1,3,1);
plot(funkce(x,0));
ax2 = subplot(1,3,2);
plot(funkce(x,1));
ax3 = subplot(1,3,3);
plot(funkce(x,2));

linkaxes([ax1,ax2,ax3],'xy');

% 4) Vykreslete 3D graf funkce f(x,y) pro x = -5...5 skrokem délky 0,1 a y = -6...6 skrokem délky 0,2

x = -5;0.1;5;
y = -6;0.2;6;

mesh(funkce(x,y));

% 2) Napište   funkci   v   Matlabu,   která   vyhodnotí   funkční   předpis   daný   níže. 
% Pokud   budeuživatelem   zadaná   pouze   jedna   vstupní   proměnná  x,  
% pak   nechť  y  má   standardníhodnotu nula.
% Funkce tedy sama rozpozná kolik vstupních proměnných uživatel zadá(nargin). 
% Funkce nechť funguje vektorově, tedy zadá-li uživatel libovolně rozměrnépole hodnot,
% vyhodnotí se funkce pro každý prvek pole zvlášť (element-wise).
% Zákazpoužití cyklů for nebo while.)

function out = funkce(x,y)
    switch nargin
        case 1
            y = 0;
    end
    out = tanh(x.*y) + x .* exp(1).^(-x.^2 - y.^2);
end