function [vec, lambda] = mocninna_metoda(A, y0, tol, maxit)
    yi = y0;
    for iter=1:1:maxit
    	lambdaP = 10000;
        yip = yi;
        yi = A * yip;

%         s = sign(yip(find(yi==max(abs(yi)))))
%         v = yip(find(yi==max(abs(yi))))
        
        [M, I] = max(abs(yi));

        lambda = (M/yip(I)) * sign(yip(I)) * sign(yi(I)); 
        if abs(lambda - lambdaP) < tol
              break
        end   
       	lambdaP = lambda;
    end
    ySum = sum(yi, 'all');
    vec = yi / ySum;
end