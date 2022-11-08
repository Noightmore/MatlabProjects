 
% [sig, Fs] = audioread();
% NBITS = audioinfo().BitsPerSample;
% disp('Puvodni signal');
% sound(4*sig, Fs);

clc; clearvars; close all;

% Fs = 8000;
% T = 2; 
% T2 = 1/2;
% Ts = 1/Fs;
% t2 = 0:Ts:T2-Ts;
% 
% t = 0:Ts:T-Ts;
%  
% FA = 440;
% sig = cos(2*pi*FA*t + pi/3)/2; % na fazi (+ pi/3 nezalezi); deleni, amplituda snizi hlasitost
% plot(sig);
% 
% FA4 = 440;z
% FA3 = 220;
% 
% 
% sound(sig, Fs);
% 
% sigA4 = cos(2*pi*FA4*t + pi/3);
% sigA3 = cos(2*pi*FA3*t2 + pi/3);
% 
% sig = sigA3 + sigA4;
% sound(sig, Fs);

Fs = 8000;
Ts = 1/Fs;
BPM = 120;
seconds_in_minute = 60;

A4 = 440;
q = 2^(1/12);



T_ctvrt = seconds_in_minute/BPM;
T_pul = 2*T_ctvrt;
 
% vzorkovani
t_ctvrt = 0:Ts:T_ctvrt - Ts - (T_ctvrt/10);
t_pul = 0:Ts:T_pul - Ts - (T_ctvrt/10);


GL = A4 / q^2;
EL = A4 / q^5;
FL = A4 / q^4;

sigA4_ctvrt = cos(2*pi*A4*t_ctvrt);
sigG4_ctvrt = cos(2*pi*GL*t_ctvrt);
sigE_ctrvt = cos(2*pi*EL*t_ctvrt);

sigG4_pul = cos(2*pi*GL*t_pul);
sigF_pul = cos(2*pi*FL*t_ctvrt);

pomlka_ctvrt = zeros(1, T_ctvrt*Fs);
pauza = zeros(1, T_ctvrt*10);

sig = [sigG4_ctvrt pauza sigG4_ctvrt pauza sigE_ctrvt pauza pomlka_ctvrt...
    sigG4_ctvrt pauza sigG4_ctvrt pauza sigE_ctrvt pauza pomlka_ctvrt...
    sigG4_ctvrt pauza sigG4_ctvrt pauza sigA4_ctvrt pauza sigG4_ctvrt pauza sigG4_pul pauza sigF_pul...
    ];

sound(sig, Fs);
