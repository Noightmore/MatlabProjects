% cv_10a

clear;
clf;
clc;
close all;

a = 1;
b = 0.5;
fDomain = -0.5:0.01:1;
gDomain = -0.5:0.1:2;
tolerance = 1e-12;
limit = 1000;

% Inline funkce, nebo jak tomu rika na seminari - "symbolicka funkce"
g = @(x)log(x + 0.5);
f = @(x) (x.^2 / a.^2) + (log(x + 0.5).^2 / b.^2) - 1;
fp = @(x) (2.*x / a^2) + (2 .* g(x)) / (b.^2 .* (x + 0.5));

% Vykreslení elipsy
clf;
hold on;
xlim([-1 1]);
ylim([-1 1]);
yline(0);
xline(0);
fi = linspace(0, 2 * pi);
xEl = a * cos(fi);
yEl = b * sin(fi);
plot(xEl, yEl, 'r');


% vykresleni nelin. rovnice
plot(fDomain, f(fDomain));

% vykresleni funkce g
plot(gDomain, g(gDomain));


% Vysetreni sus bodů

[biX] = bisection(f, 0, .2, tolerance, limit);
[neX] = newton(f, fp, 0, tolerance, limit);
[ndX] = newton_diff(f,0, .2, tolerance, limit);

plot([biX neX ndX], [g(biX) g(neX) g(ndX)], '.', 'markersize', 24);
plot([biX neX ndX], [f(biX) f(neX) f(ndX)], '.', 'markersize', 24);

x1 = (biX + neX + ndX) * (1/3);

[biX] = bisection(f, .7, .9, tolerance, limit);
[neX] = newton(f, fp, .7, tolerance, limit);
[ndX] = newton_diff(f,.7, .9, tolerance, limit);

plot([biX neX ndX], [g(biX) g(neX) g(ndX)], '.', 'markersize', 24);
plot([biX neX ndX], [f(biX) f(neX) f(ndX)], '.', 'markersize', 24);

x2 = (biX + neX + ndX) * (1/3);

saveas(gcf, "graph.png");