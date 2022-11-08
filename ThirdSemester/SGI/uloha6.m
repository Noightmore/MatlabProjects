% uloha 6 

clear vars; clc; close all;

[sig, Fs] = audioread('ovcaci-housle.wav');
subplot(3,1,1);
plot(sig);

delka = numel(sig);

N = 256;
zcri = 1;
suma = 0;
for ramec=2:128:(854-256)
    for i=ramec:1:ramec+256
        suma = suma + abs(sign(sig(i)) - sign(sig(i-1)));
    end
    zcr(zcri) = 1/(2*(delka-1)) * suma;
    zcri = zcri+1;
end




subplot(3,1,2);
plot(zcr);

%subplot(3,2,2)
%spectrogram(mel, hamming(256), 128, 256, Fs, 'yaxis');