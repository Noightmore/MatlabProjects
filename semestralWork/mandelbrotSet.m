clear
close all
clc

step = 0.02;
realPartPlot = -2:step:1;
imaginaryPartPlot = -1:step:1;

hold on

for re = realPartPlot
    for im = imaginaryPartPlot
        c = re + im*1i;
        if(mandelbrotCheck(c, 200))
            plot(re, im, 'black.');
        end
    end
end

% todo change color on how much deviation numbers deviate
