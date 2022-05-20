% cv_10b
clear; clc; close all

format long;

gps_tracking_data;

% fce pro vypocet vzdalenosti 2 bodu.
% symbolicka
d = @(x,y) sqrt( ...
                (x(1)-y(1))^.2 ...
                + (x(2) - y(2))^2 ...
                + (x(3) - y(3))^.2 ...
                );

% pocatecni odhad vectoru
x0 = [1;1;1];
tol = 1e-8;
maxit = 100;

% Soustava rovnic
F = @(x) [...
            d(x, x1) - d1;...
            d(x, x2) - d2;...
            d(x, x3) - d3...
        ];

% jacobianska matice
J = @(x) [
           (x-x1)'/d(x,x1);...
           (x-x2)'/d(x,x2);...
           (x-x3)'/d(x,x3)...
         ];

[x,k] = newton_raphson(F,J,x0,tol,maxit);

fprintf('Newton Raphson took %d iterations\n',k);
fprintf('GPS location = [%f %f %f]\n', x(1), x(2), x(3));