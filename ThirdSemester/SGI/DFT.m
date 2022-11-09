function [X] = DFT(x, N)
    
    for k = 0:1:N-1
        sum = 0;
        for n = 0:1:N-1
            sum = sum + x(n+1) * exp(-1*(1i*2*pi*n*k *(1/N)));
        end
        X(k+1) = sum * (1/N);        
    end
end