clear
close all
clc

mytime = datetime;
[h,m,s] = hms(mytime);
minutes = h*60 + m + s/60;

%num = float2bin(minutes, 12);