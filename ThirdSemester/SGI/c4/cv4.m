clc; clear; close all;

fig = figure;
fig.WindowState = 'maximized';

t = tiledlayout(1, 3);
disp(t)



data = audioread('cv04_00.wav');
metadata = audioinfo('cv04_00.wav');
sampleCount = 100;
    
dataTime = (0:metadata.TotalSamples - 1) / metadata.SampleRate;
time = (0:sampleCount:metadata.TotalSamples - 1) / metadata.SampleRate;
    
energy = getSignalEnergy(data, metadata.TotalSamples, sampleCount);
causalDiff = [data(1) arrayfun(@(index) data(index) - data(index - 1), 2:numel(data))];
    
   
nexttile;
plot(dataTime, data);
xlim([0 metadata.Duration]);
title(path, "Interpreter","none");
    
nexttile;
plot(time, energy);
xlim([0 metadata.Duration]);
title("Energie");
    
nexttile;
plot(time, causalDiff);
xlim([0 metadata.Duration]);
title("Zpětná diference");
