clear;clc;close all

[sig,Fs]=audioread('ovcaci-housle.wav');
subplot(3,1,1)
plot(sig)

len=numel(sig);

i=1;
zcrIndex=1;

while i<len-256
    suma=0;
    for j=1:1:255
        suma=suma+(abs(sign(sig(i+j)))-sign(sig(i+j-1)));
    end
    ZCR(zcrIndex)=suma/(2*255);
    zcrIndex=zcrIndex+1;
    i=i+128;
end

subplot(3,1,2)
plot(ZCR)

n=1:1:256;
w=1/2*(1-cos(2*pi*n/255));

spectogram(sig,w,128,256,Fs,'yaxis')