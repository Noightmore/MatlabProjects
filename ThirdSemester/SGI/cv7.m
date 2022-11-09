% cv7
clear vars; clc; close all

N1 = 10;
N2 = 20;

Fs = 10;
t = 1:1/Fs:2-1/Fs; % ne do fs ale do N




F1 = 4;
F2 = 2.5;
F3 = 12;
F4 = 7.25;


f1 = cos(2*pi * F1 * t);
f2 = cos(2*pi*F2*t);
f3 = cos(2*pi*F3 * t);
f4 = cos(2*pi*F4 * t);

X1 = abs(DFT(f1, N1));

X2 = abs(DFT(f2, N1));
X3 = abs(DFT(f3, N1));
X4 = abs(DFT(f4, N1));

% X11 = abs(DFT(f1, N2));
% X22 = abs(DFT(f2, N2));
% X33 = abs(DFT(f3, N2));
% X44 = abs(DFT(f4, N2));
% 
subplot(2,4, 1);
stem(t, X1);

subplot(2, 4, 3);
stem(t ,X2);

subplot(2, 4, 5);
stem(t ,X3);

subplot(2, 4, 7);
stem(t ,X4);