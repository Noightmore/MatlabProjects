clc;
close all;
clear vars;

f = 2;
pocet = 1000;
Fs= 1000;
t=-1:1/Fs:1;

s1=cos(2*pi*t*f*0 - pi/2);
s2=cos(2*pi*t*f*0 - pi/2);

for n = 1:pocet
   s2=s2+(1/n)*cos(2*f*pi*t*n - pi/2);
   
   %title(n);
   %pause;
end

dd=1;
for n = 1:pocet
    s1=s1+(1/dd)*cos(2*f*pi*t*dd - pi/2);
    dd=dd+2;
end


subplot(2,2,3);
plot(t, s1);

subplot(2,2,2);
plot(t, s2)

% zobrazeni grafu
N = 1000;
f = 0:Fs/N:Fs/2-Fs/N;
X = fft(s1,N);
subplot(2,2,4);
stem(f(1:40),1/(N/2)*abs(X(1:40)),'.');

N = 1000;
f = 0:Fs/N:Fs/2-Fs/N;
X = fft(s2,N);
subplot(2,2,1);
stem(f(1:40),1/(N/2)*abs(X(1:40)),'.');