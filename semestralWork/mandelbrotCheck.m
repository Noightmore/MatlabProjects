
function [deviation] = mandelbrotCheck(c, maxIteration)
    iterationCounter = 0;
    z = 0;
    while abs(z) < 2 && iterationCounter < maxIteration
        z = z^2 + c;
        iterationCounter = iterationCounter + 1;
    end
    
    deviation = iterationCounter;
end