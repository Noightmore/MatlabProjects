function [vec, lambda] = mocninna_metoda(A, y0, tol, maxit)
    yi = y0;
    for iter=1:1:maxit
    	lambdaP = 10000;
        yip = yi;
        yi = A * yip;
        lambda = max(abs(yi))/yip(find(yi==max(abs(yi))));  
        if abs(lambda - lambdaP) < tol
              break
        end   
       	lambdaP = lambda;
    end
    ySum = sum(yi, 'all');
    vec = yi / ySum;
  endfunction [vec, lambda] = mocninna_metoda(A, y0, tol, maxit)
    yi = y0;
    for iter=1:1:maxit
    	lambdaP = 10000;
        yip = yi;
        yi = A * yip;
        lambda = max(abs(yi))/yip(find(yi==max(abs(yi))));  
        if abs(lambda - lambdaP) < tol
              break
        end   
       	lambdaP = lambda;
    end
    ySum = sum(yi, 'all');
    vec = yi / ySum;
  end