% cv7
clear vars; clc; close all

N1 = 10;
N2 = 20;

Fs = 10;
t = 1:1/Fs:2-1/Fs; 
t2 = 1:1/(2*Fs):2-1/(2*Fs);

F1 = 4;
F2 = 2.5;
F3 = 12;
F4 = 7.25;

f1 = cos(2*pi * F1 * t);
f2 = cos(2*pi*F2*t);
f3 = cos(2*pi*F3 * t);
f4 = cos(2*pi*F4 * t);

f11 = cos(2*pi * F1 * t2);
f22 = cos(2*pi*F2*t2);
f33 = cos(2*pi*F3 * t2);
f44 = cos(2*pi*F4 * t2);

X1 = abs(DFT(f1, N1));

X2 = abs(DFT(f2, N1));
X3 = abs(DFT(f3, N1));
X4 = abs(DFT(f4, N1));

X11 = abs(DFT(f11, N2));
X22 = abs(DFT(f22, N2));
X33 = abs(DFT(f33, N2));
X44 = abs(DFT(f44, N2));

subplot(4,2, 1);
stem(t, X1);

subplot(4, 2, 2);
stem(t2, X11);

subplot(4, 2, 3);
stem(t ,X2);

subplot(4, 2, 4);
stem(t2, X22);

subplot(4, 2, 5);
stem(t ,X3);

subplot(4, 2, 6);
stem(t2, X33);

subplot(4, 2, 7);
stem(t ,X4);

subplot(4, 2, 8);
stem(t2, X44);
